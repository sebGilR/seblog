class ProjectUpdatesController < ApplicationController
  before_action :set_project_update, only: %i[ show edit update destroy ]

  # GET /project_updates or /project_updates.json
  def index
    @project_updates = ProjectUpdate.all
  end

  # GET /project_updates/1 or /project_updates/1.json
  def show
  end

  # GET /project_updates/new
  def new
    @project_update = ProjectUpdate.new
  end

  # GET /project_updates/1/edit
  def edit
  end

  # POST /project_updates or /project_updates.json
  def create
    @project_update = ProjectUpdate.new(project_update_params)

    respond_to do |format|
      if @project_update.save
        format.html { redirect_to @project_update, notice: "Project update was successfully created." }
        format.json { render :show, status: :created, location: @project_update }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_updates/1 or /project_updates/1.json
  def update
    respond_to do |format|
      if @project_update.update(project_update_params)
        format.html { redirect_to @project_update, notice: "Project update was successfully updated." }
        format.json { render :show, status: :ok, location: @project_update }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_updates/1 or /project_updates/1.json
  def destroy
    @project_update.destroy
    respond_to do |format|
      format.html { redirect_to project_updates_url, notice: "Project update was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_update
      @project_update = ProjectUpdate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_update_params
      params.require(:project_update).permit(:description, :project_id)
    end
end
