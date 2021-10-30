class Article < ApplicationRecord
  searchkick text_middle: [:title, :text] 
  include Publishable

  belongs_to :learning_log, optional: true

  validates_presence_of :title, :text

  def search(query, options = {})
    unless options.empty?
      super(query, options)
    else
      options = {
        fields: ['title^2', :text],
        match: :text_middle,
        where: { published: true }
      }
      super(query, options)
    end
  end
end
