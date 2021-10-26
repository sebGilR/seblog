class AddPublishedAtToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :published_at, :timestamp, default: nil
  end
end
