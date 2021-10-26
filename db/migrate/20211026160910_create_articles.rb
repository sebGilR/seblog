class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :text
      t.integer :likes
      t.integer :status

      t.timestamps
    end
  end
end
