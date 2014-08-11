class Post < ActiveRecord::Base
  acts_as_taggable

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :body, :title, :author_id, presence: :true
  validates :body, length: { minimum: 50}

  def tag!(tags)
    tag_list.add( Array(tags).map(&:split).flatten )
    save!
  end

  def untag!(tags)
    tag_list.remove( Array(tags) )
    save!
  end
end
