class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  def self.search(query)
    where("title ilike :q", q: "%#{query}%")
  end
end
