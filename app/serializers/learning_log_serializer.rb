class LearningLogSerializer
  include JSONAPI::Serializer
  attributes :title, :description

  has_many :entries, if: Proc.new { |record| record.entries.any? }
  has_many :articles, if: Proc.new { |record| record.articles.any? }
end
