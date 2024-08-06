# frozen_string_literal: true

module Chart
  class Day
    attr_reader :date
    attr_reader :outdated_gem_count

    def initialize(date:, outdated_gem_count:)
      @date = date
      @outdated_gem_count = outdated_gem_count
    end
  end
end
