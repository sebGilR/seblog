class Article < ApplicationRecord
  include Publishable
  belongs_to :learning_log, optional: true

  validates_presence_of :title, :text
end
