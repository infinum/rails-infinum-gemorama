# frozen_string_literal: true

namespace :chart do
  desc 'Generate chart showing outdated count of dependencies on each day'
  task :create, [:from, :to, :branch, :project_path] => [:environment] do |_task, args|
    start_date = Date.parse(args[:from])
    end_date = Date.parse(args[:to])
    branch = args[:branch]
    repo = args[:project_path]

    datafile = Chart.generate(start_date:, end_date:, branch:, repo:)

    puts 'After turning on the Rails server, you can view your data under the following link:'
    puts Rails.application.routes.url_helpers.project_url(datafile.name)
  end
end
