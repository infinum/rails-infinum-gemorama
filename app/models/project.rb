# frozen_string_literal: true

class Project
  include ActiveModel::Model

  attr_accessor :project_file_name, :data

  def name
    project_file_name.split('/').last.split('.csv').first
  end
end
