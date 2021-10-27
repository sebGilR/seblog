module Publishable
  extend ActiveSupport::Concern

  included do
    after_initialize :set_default_status, :if => :new_record?
    enum status: [:draft, :published]

    scope :published, -> { where(status: :published) }
    scope :draft, -> { where(status: :draft) }
  end

  def set_default_status
    self.status ||= :draft
  end

  def draft!
    update(published_at: nil, status: :draft)
  end

  def published!
    update(:published_at, Time.now, status: :published)
  end

end