class CreateLearningLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :learning_logs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
