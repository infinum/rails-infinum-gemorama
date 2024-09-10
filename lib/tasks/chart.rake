# frozen_string_literal: true

namespace :chart do
  desc 'Generate chart showing outdated count of dependencies on each day'
  task :create, [:from, :to, :branch, :step, :project_path] => [:environment] do |_task, args|
    start_date = Date.parse(args[:from])
    end_date = Date.parse(args[:to])
    branch = args[:branch]
    step_factor = args[:step]
    repo = args[:project_path]

    datafile = Chart.generate(start_date:, end_date:, branch:, step_factor:, repo:)

    puts "\e[32mDone!\e[0m\n\nAfter turning on the Rails server, you can view your data under the following link:\n"
    puts "\e[34m#{Rails.application.routes.url_helpers.project_url(datafile.name)}\e[0m"
  end
end
