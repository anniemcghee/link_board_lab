class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
    presence: true,
    length: { minimum: 10, maximum: 100 }

  validates :link,
    presence: true

  validates_format_of :link, :with => URI::regexp(%w(http https))
# post.title
# required
# should be between 10 and 100 chars
# post.link
# required
# should be a valid url
end
