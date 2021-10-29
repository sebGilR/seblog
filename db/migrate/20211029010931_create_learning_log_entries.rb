class CreateLearningLogEntries < ActiveRecord::Migration[6.1]
  def change
    drop_table :learning_log_entries

    create_table :learning_log_entries do |t|
      t.text :content

      t.timestamps
    end
  end
end
