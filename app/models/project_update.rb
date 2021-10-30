class ProjectUpdate < ApplicationRecord
  belongs_to :project
  validates_presence_of :description
end
