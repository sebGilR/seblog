class LearningLogsController < ApplicationController
  before_action :set_learning_log, only: %i[ show edit update destroy ]

  def index
    @learning_logs = LearningLog.all
  end

  def show
  end

  def new
    @learning_log = LearningLog.new
  end

  def edit
  end

  def create
    @learning_log = LearningLog.new(learning_log_params)

    if @learning_log.save
      render json: @learning_log, status: :created
    else
      render json: { errors: @learning_log.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @learning_log.update(learning_log_params)
      render json: @learning_log, status: :ok
    else
      render json: { errors: @learning_log.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @learning_log.destroy
    head :no_content
  end

  def search
    @learning_logs = LearningLog.where('title LIKE ? OR description LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")

    render :index
  end

  private

  def set_learning_log
    @learning_log = LearningLog.find(params[:id])
  end

  def learning_log_params
    params.require(:learning_log).permit(:title, :description, :article)
  end
end
