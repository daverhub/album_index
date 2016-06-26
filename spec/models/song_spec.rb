require 'rails_helper'

RSpec.describe Song, type: :model do
  describe '#search' do
    it 'should return song matching search query' do
      song = FactoryGirl.create(:song)
      expect(Song.search("Someone like you")).to include song  
    end

    it 'does not return song that do not match seach query' do
      song = FactoryGirl.create(:song)
      expect(Song.search("Lemonade")).to_not include song  
    end

  end
end
