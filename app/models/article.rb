class Article < ApplicationRecord
  searchkick
  include Publishable

  belongs_to :learning_log, optional: true

  validates_presence_of :title, :text

  def search(query, options = {})
    unless options.empty?
      super(query, options)
    else
      super(query, fields: ['title^2', :text], where: { published: true })
    end
  end
end
