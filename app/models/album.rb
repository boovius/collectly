class Album < ActiveRecord::Base
  validates :title, uniqueness: {scope: :artist_id}
  validates :title, presence: true

  has_many   :songs
  belongs_to :artist
  belongs_to :user

  def image_path
    url = image_url.blank? ? '/images/album-placeholder.png' : image_url
  end
end
