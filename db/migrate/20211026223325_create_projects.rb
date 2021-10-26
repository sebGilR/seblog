class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :demo_link
      t.string :repo_link

      t.timestamps
    end
  end
end
