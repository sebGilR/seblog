class LearningLogUpdatesController < ApplicationController
  before_action :set_learning_log_update, only: %i[ show edit update destroy ]
  before_action :set_learning_log_updates, only: %i[ index ]

  def index
    @learning_log_updates
  end

  def show
  end

  def new
    @learning_log_update = LearningLogUpdate.new
  end

  def edit
  end

  def create
    @learning_log_update = LearningLogUpdate.new(learning_log_update_params)

    if @learning_log_update.save
      render json: @learning_log_update, status: :created
    else
      format.html { render :new, status: :unprocessable_entity }
      render json: { errors: @learning_log_update.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @learning_log_update.update(learning_log_update_params)
      render json: @learning_log_update, status: :ok
    else
      format.html { render :edit, status: :unprocessable_entity }
      render json: { errors: @learning_log_update.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @learning_log_update.destroy
    head :no_content
  end

  private

  def set_learning_log_updates
    @learning_log_updates = LearningLogUpdate.where(learning_log_id: params[:learning_log_id])
  end
  
  def set_learning_log_update
    @learning_log_update = LearningLogUpdate.find(params[:id])
  end

  def learning_log_update_params
    params.require(:learning_log_update).permit(:description, :learning_log_id)
  end
end
