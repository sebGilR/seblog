class CreateLearningLogUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :learning_log_updates do |t|
      t.text :description
      t.belongs_to :learning_log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
