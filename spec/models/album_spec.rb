require 'rails_helper'

RSpec.describe Album, type: :model do
   describe '#search' do
    it 'should return album matching search query' do
      album = FactoryGirl.create(:album)
      expect(Album.search("Adele 21")).to include album  
    end

     it 'does not return album that do not match seach query' do
      album = FactoryGirl.create(:album)
      expect(Album.search("Lemonade")).to_not include album
    end
  end
end
