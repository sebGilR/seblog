class Admin::ProjectUpdatesController < ApplicationController
  before_action :set_project_update, only: %i[ show edit update destroy ]

  def index
    @project_updates = ProjectUpdate.all
  end

  def show
  end

  def new
    @project_update = ProjectUpdate.new
  end
  
  def edit
  end

  def create
    @project_update = ProjectUpdate.new(project_update_params)

    if @project_update.save
      redirect_to @project_update, notice: 'Project update was successfully created.'
    else
      flash[:error] = @project_update.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @project_update.update(project_update_params)
      redirect_to @project_update, notice: 'Project update was successfully updated.'
    else
      flash[:error] = @project_update.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @project_update.destroy
    redirect_to project_updates_url, notice: 'Project update was successfully destroyed.'
  end

  private
    
  def set_project_update
    @project_update = ProjectUpdate.find(params[:id])
  end

  def project_update_params
    params.require(:project_update).permit(:description, :project_id)
  end
end
