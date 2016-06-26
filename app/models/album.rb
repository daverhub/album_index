class Album < ActiveRecord::Base
  belongs_to :Artist
  has_many :songs

  def self.search(query)
    where("title ilike :q", q: "%#{query}%")
  end
end
