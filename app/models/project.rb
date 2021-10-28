class Project < ApplicationRecord
  include Publishable

  has_many :updates, class_name: 'ProjectUpdate', dependent: :destroy
  has_many :learning_logs

  validates :name, presence: true
end
