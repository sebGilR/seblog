class Api::LearningLogsController < ApplicationController
  before_action :set_learning_log, only: %i[ show edit update destroy ]

  def index
    render json: LearningLogSerializer.new(LearningLog.all), status: :ok
  end

  def show
  end

  def create
    @learning_log = LearningLog.new(learning_log_params)

    if @learning_log.save
      render json: LearningLogSerializer.new(@learning_log), status: :created
    else
      render json: { errors: @learning_log.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @learning_log.update(learning_log_params)
      render json: LearningLogSerializer.new(@learning_log), status: :ok
    else
      render json: { errors: @learning_log.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @learning_log.destroy
    head :no_content
  end

  private

  def set_learning_log
    @learning_log = LearningLog.find(params[:id])
  end

  def learning_log_params
    params.require(:learning_log).permit(:title, :description, :article)
  end
end
