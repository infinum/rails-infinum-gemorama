# frozen_string_literal: true

module Chart
  def self.generate(**args)
    generator = Chart::Generator.new(**args).create

    Chart::FileStorage.create(name: generator.project_name, days: generator.days)
  end
end
