class Api::ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    render json: ProjectSerializer.new(Project.all), status: :ok
  end

  def show
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: ProjectSerializer.new(@project), status: :created
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json:ProjectSerializer.new(@project), status: :ok
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :demo_link, :repo_link)
  end
end
