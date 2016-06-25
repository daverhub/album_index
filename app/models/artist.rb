class Artist < ActiveRecord::Base
  has_many :songs
  has_many :albums


  def self.search(query)
    where("name ilike :q", q: "%#{query}%")
  end
end
