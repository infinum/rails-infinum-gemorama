# frozen_string_literal: true

module Chart
  class FileStorage
    class << self
      def create(**args)
        new(**args).create
      end

      def find(name)
        file = new(name:)
        raise ActiveRecord::RecordNotFound, 'file not found' unless File.exist?(file.file_path)

        file.file_path
      end
    end

    attr_reader :name

    def initialize(name:, days: [])
      @name = name
      @days = days
      @file = nil
    end

    def create
      self.file = File.open(file_path, 'w') do |file|
        days.each do |day|
          file.puts "#{day.date};#{day.outdated_gem_count}"
        end
      end

      self
    end

    def file_path
      Rails.root.join("public/data/#{name}.csv")
    end

    private

    attr_reader :days
    attr_writer :file
  end
end
