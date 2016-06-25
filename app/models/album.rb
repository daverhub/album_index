class Album < ActiveRecord::Base
  belongs_to :Artist
  has_many :songs
  validates :title, presence: true
  validates :title, uniqueness: true

  def self.search(query)
    where("title ilike :q", q: "%#{query}%")
  end
end
