class Artist < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :albums
  has_many :songs, through: :albums
end
