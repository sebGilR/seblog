class LearningLog < ApplicationRecord
  include Publishable

  has_many :articles
  has_many :entries, class_name: 'LearningLogEntry', dependent: :destroy
  validates_presence_of :title, :description
end
