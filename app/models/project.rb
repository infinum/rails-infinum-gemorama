# frozen_string_literal: true

class Project
  include ActiveModel::Model

  attr_accessor :project_file_path
  attr_accessor :data

  def name
    project_file_path.split('/').last.split('.csv').first
  end
end
