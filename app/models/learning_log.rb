class LearningLog < ApplicationRecord
  has_many :articles
  validates_presence_of :title, :description

  after_initialize :set_default_status, :if => :new_record?

  enum status: [:draft, :published]


  def set_default_status
    self.status ||= :draft
  end

  def draft!
    self.status = :draft
    self.published_at = nil
  end

  def published!
    self.status = :published
    self.published_at = Time.now
    self.save
  end
end
