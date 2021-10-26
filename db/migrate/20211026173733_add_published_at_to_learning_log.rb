class AddPublishedAtToLearningLog < ActiveRecord::Migration[6.1]
  def change
    add_column :learning_logs, :published_at, :timestamp, default: nil
  end
end
