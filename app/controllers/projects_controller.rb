# frozen_string_literal: true

require 'csv'

class ProjectsController < ApplicationController
  def show
    project_file_name = Chart::FileStorage.find(params[:id])

    @project = Project.new(
      project_file_name: project_file_name,
      data: CSV.read(project_file_name, col_sep: ';').to_h
    )
  end
end
