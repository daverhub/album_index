require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe '#search' do
    it 'should return artist matching search query' do
      artist = FactoryGirl.create(:artist)
      expect(Artist.search("Adele")).to include artist  
    end

    it 'does not return artists that do not match seach query' do
      artist = FactoryGirl.create(:artist)
      expect(Artist.search("Drake")).to_not include artist
    end
  end
end
