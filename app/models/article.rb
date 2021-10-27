class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :learning_log, optional: true

  validates_presence_of :title, :text

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
