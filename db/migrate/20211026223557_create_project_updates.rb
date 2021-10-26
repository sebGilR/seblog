class CreateProjectUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :project_updates do |t|
      t.text :description
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
