class AddStatusToLearningLog < ActiveRecord::Migration[6.1]
  def change
    add_column :learning_logs, :status, :integer
  end
end
