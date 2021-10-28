class LearningLog < ApplicationRecord
  include Publishable

  has_many :articles
  has_many :updates, class_name: 'LearningLogUpdate', dependent: :destroy
  validates_presence_of :title, :description
end
