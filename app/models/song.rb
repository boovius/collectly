class Song < ActiveRecord::Base
  validates :title, uniqueness: {scope: :album_id }
end
