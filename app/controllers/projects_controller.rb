# frozen_string_literal: true

class ProjectsController < ApplicationController
  def show
    project_file = Chart::FileStorage.find(params[:id])

    @project = Project.new(
      project_file_path: project_file.file_path.to_s,
      data: project_file.as_csv.to_h
    )
  end
end
