class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :genre
  enum(release_status: {
    unreleased: 0,
    released: 1
  })
  enum(publish_status: {
    draft: 0,
    published: 1
  })
  has_one_attached :image
end
