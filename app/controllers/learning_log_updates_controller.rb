class LearningLogEntriesController < ApplicationController
  before_action :set_learning_log_entry, only: %i[ show edit update destroy ]

  def index
    @learning_log_entries = LearningLogUpdate.where(learning_log_id: params[:learning_log_id])
  end

  def show
  end

  def new
    @learning_log_entry = LearningLogUpdate.new
  end

  def edit
  end

  def create
    @learning_log_entry = LearningLogUpdate.new(learning_log_entry_params)

    if @learning_log_entry.save
      render json: @learning_log_entry, status: :created
    else
      render json: { errors: @learning_log_entry.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @learning_log_entry.update(learning_log_entry_params)
      render json: @learning_log_entry, status: :ok
    else
      render json: { errors: @learning_log_entry.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @learning_log_entry.destroy
    head :no_content
  end

  private
  
  def set_learning_log_entry
    @learning_log_entry = LearningLogUpdate.find(params[:id])
  end

  def learning_log_entry_params
    params.require(:learning_log_entry).permit(:description, :learning_log_id)
  end
end
