class ArticleSerializer
  include JSONAPI::Serializer
  attributes :title, :text, :created_at, :updated_at

  attribute :updated_at do |object|
    object.updated_at.strftime("%d %b %y")
  end

  attribute :created_at do |object|
    object.updated_at.strftime("%d %b %y")
  end
  
  belongs_to :learning_log, if: Proc.new { |record| record.learning_log.present? }
end
