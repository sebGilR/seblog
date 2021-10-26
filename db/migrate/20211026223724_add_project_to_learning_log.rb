class AddProjectToLearningLog < ActiveRecord::Migration[6.1]
  def change
    add_reference :learning_logs, :project, foreign_key: true
  end
end
