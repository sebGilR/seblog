class LearningLogUpdatesController < ApplicationController
  before_action :set_learning_log_update, only: %i[ show edit update destroy ]

  # GET /learning_log_updates or /learning_log_updates.json
  def index
    @learning_log_updates = LearningLogUpdate.all
  end

  # GET /learning_log_updates/1 or /learning_log_updates/1.json
  def show
  end

  # GET /learning_log_updates/new
  def new
    @learning_log_update = LearningLogUpdate.new
  end

  # GET /learning_log_updates/1/edit
  def edit
  end

  # POST /learning_log_updates or /learning_log_updates.json
  def create
    @learning_log_update = LearningLogUpdate.new(learning_log_update_params)

    respond_to do |format|
      if @learning_log_update.save
        format.html { redirect_to @learning_log_update, notice: "Learning log update was successfully created." }
        format.json { render :show, status: :created, location: @learning_log_update }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @learning_log_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_log_updates/1 or /learning_log_updates/1.json
  def update
    respond_to do |format|
      if @learning_log_update.update(learning_log_update_params)
        format.html { redirect_to @learning_log_update, notice: "Learning log update was successfully updated." }
        format.json { render :show, status: :ok, location: @learning_log_update }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @learning_log_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_log_updates/1 or /learning_log_updates/1.json
  def destroy
    @learning_log_update.destroy
    respond_to do |format|
      format.html { redirect_to learning_log_updates_url, notice: "Learning log update was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_log_update
      @learning_log_update = LearningLogUpdate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learning_log_update_params
      params.require(:learning_log_update).permit(:description, :learning_log_id)
    end
end
