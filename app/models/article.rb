class Article < ApplicationRecord
  searchkick word_middle: ['title^2', :text] 
  include Publishable

  belongs_to :learning_log, optional: true

  validates_presence_of :title, :text

  def search(query, options = {})
    unless options.empty?
      super(query, options)
    else
      options = {
        fields: ['title^2', :text],
        match: :word_middle,
        where: { published: true }
      }
      super(query, options)
    end
  end
end
