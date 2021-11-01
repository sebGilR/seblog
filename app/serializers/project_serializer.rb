class ProjectSerializer
  include JSONAPI::Serializer
  attributes :name, :description

  has_many :updates, if: Proc.new { |project| project.updates.any? }
  has_many :learning_logs, if: Proc.new { |project| project.learning_logs.any? }
end
