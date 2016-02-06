class Album < ActiveRecord::Base
  validates :title, uniqueness: {scope: :artist_id}
  validates :title, presence: true

  has_many :songs
end
