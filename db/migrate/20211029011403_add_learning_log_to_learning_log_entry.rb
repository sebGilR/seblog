class AddLearningLogToLearningLogEntry < ActiveRecord::Migration[6.1]
  def change
    add_reference :learning_log_entries, :learning_log, null: false, foreign_key: true
  end
end
