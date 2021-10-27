class Article < ApplicationRecord
  include Searchable
  include Publishable
  belongs_to :learning_log, optional: true

  validates_presence_of :title, :text
end
