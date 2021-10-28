class AddPublishedAtToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :published_at, :timestamp
  end
end
