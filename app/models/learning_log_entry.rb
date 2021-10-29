class LearningLogEntry < ApplicationRecord
  belongs_to :learning_log

  def self.search(search)
    where('title ILIKE ? OR body ILIKE ?', "%#{search}%", "%#{search}%")
  end
end
