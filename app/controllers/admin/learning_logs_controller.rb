class Admin::LearningLogsController < ApplicationController
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
      redirect_to @learning_log, notice: 'Learning log was successfully created.'
    else
      flash.now[:error] = @learning_log.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @learning_log.update(learning_log_params)
      redirect_to @learning_log, notice: 'Learning log was successfully updated.'
    else
      flash.now[:error] = @learning_log.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @learning_log.destroy
    redirect_to learning_logs_url, notice: 'Learning log was successfully destroyed.'
  end

  private

  def set_learning_log
    @learning_log = LearningLog.find(params[:id])
  end

  def learning_log_params
    params.require(:learning_log).permit(:title, :description, :article, :status)
  end
end
