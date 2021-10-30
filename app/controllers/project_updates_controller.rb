class ProjectUpdatesController < ApplicationController
  before_action :set_project_update, only: %i[ show edit update destroy ]
  before_action :set_project_updates, only: %i[ index ]

  def index
    @project_updates
  end

  def show
  end

  def create
    @project_update = ProjectUpdate.new(project_update_params)

    respond_to do |format|
      if @project_update.save
        render json: @project_update, status: :created
      else
        render json: { errors: @project_update.errors }, status: :unprocessable_entity
      end
    end
  end

  def update
    if @project_update.update(project_update_params)
      render json: @project_update, status: :ok
    else
      render json: { errors: @project_update.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @project_update.destroy
    head :no_content
  end

  private
  
  def set_project_updates
    @project_updates = ProjectUpdate.where(project_id: params[:project_id])
  end
  
  def set_project_update
    @project_update = ProjectUpdate.find(params[:id])
  end

  def project_update_params
    params.require(:project_update).permit(:description, :project_id)
  end
end
