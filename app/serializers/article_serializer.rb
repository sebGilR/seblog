class ArticleSerializer
  include JSONAPI::Serializer
  attributes :title, :text
  
  belongs_to :learning_log, if: Proc.new { |record| record.learning_log.present? }
end
