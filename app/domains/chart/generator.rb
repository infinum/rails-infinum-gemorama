# frozen_string_literal: true

module Chart
  class Generator
    attr_reader :days

    def initialize(start_date:, end_date:, branch:, step_factor:, repo:)
      @start_date = start_date
      @end_date = end_date
      @branch = branch
      @step_factor = step_factor.to_i
      @repo = repo
      @days = []
      @progress = ProgressBar.new(((end_date - start_date).to_i + 1) / @step_factor)
    end

    def create
      self.days = map_days

      self
    end

    def project_name
      repo.split('/').last
    end

    private

    attr_reader :start_date
    attr_reader :end_date
    attr_reader :branch
    attr_reader :step_factor
    attr_reader :progress
    attr_reader :repo
    attr_writer :days

    def map_days
      previous_sha = nil

      (start_date..end_date).step(step_factor).map do |date|
        sha = `cd #{repo} && git rev-list -1 --before="#{date}" #{branch}`.strip

        `cd #{repo} && OVERCOMMIT_DISABLE=1 git checkout #{sha} Gemfile.lock > /dev/null 2>&1` if previous_sha != sha

        count = outdated_gem_count(date)
        previous_sha = sha
        progress.increment!

        Day.new(date:, outdated_gem_count: count)
      end
    end

    def outdated_gem_count(time) # rubocop:disable Metrics/AbcSize
      count = 0
      parser.specs.each do |gem_specification|
        gem = Rubygem.find_by(name: gem_specification.name)
        current_version = gem.versions.release.find_by(number: gem_specification.version.to_s)
        next if current_version.nil? || gem.versions.release.empty?

        count += 1 if gem.versions.release.where(position: ...current_version.position, created_at: ...time).any?
      end

      count
    end

    def parser
      Bundler::LockfileParser.new(gemfile_lock)
    end

    def gemfile_lock
      Bundler.read_file("#{repo}/Gemfile.lock")
    end
  end
end
