class LearningLogEntry < ApplicationRecord
  belongs_to :learning_log
  validates_presence_of :content

  def self.search(search)
    where('title ILIKE ? OR body ILIKE ?', "%#{search}%", "%#{search}%")
  end
end
