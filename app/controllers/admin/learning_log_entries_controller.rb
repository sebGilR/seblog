class Admin::LearningLogEntriesController < ApplicationController
  before_action :set_learning_log_entry, only: %i[ show edit update destroy ]

  def index
    @learning_log_entries = LearningLogEntry.all
  end

  def show
  end

  def new
    @learning_log_entry = LearningLogEntry.new
  end

  def edit
  end

  def create
    @learning_log_entry = LearningLogEntry.new(learning_log_entry_params)

    if @learning_log_entry.save
      redirect_to @learning_log_entry, notice: 'Learning log entry was successfully created.'
    else
      flash[:error] = @learning_log_entry.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @learning_log_entry.update(learning_log_entry_params)
      redirect_to @learning_log_entry, notice: 'Learning log entry was successfully updated.'
    else
      flash[:error] = @learning_log_entry.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @learning_log_entry.destroy
    redirect_to learning_log_entries_url, notice: 'Learning log entry was successfully destroyed.'
  end

  private
  
  def set_learning_log_entry
    @learning_log_entry = LearningLogEntry.find(params[:id])
  end

  def learning_log_entry_params
    params.require(:learning_log_entry).permit(:description, :learning_log_id)
  end
end
