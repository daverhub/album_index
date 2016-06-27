require 'rails_helper'

feature "user searches for songs" do
  
  before :each do
    artist = FactoryGirl.create(:artist)
    album = FactoryGirl.create(:album, artist_id: artist.id)
    @song = FactoryGirl.create(:song, artist_id: artist.id, album_id: album.id)
  end

  scenario "user searches by song title" do
    
    visit root_path
    fill_in :song, with: "Someone like you"
    click_button "Search"

    expect(page).to have_content(@song.title)
    expect(page).to have_content(@song.artist.name)
    expect(page).to have_content(@song.album.title)
  end

  scenario "user searches by Artist" do
    
    visit root_path
    fill_in :artist, with: "Adele"
    click_button "Search"

    expect(page).to have_content(@song.title)
    expect(page).to have_content(@song.artist.name)
    expect(page).to have_content(@song.album.title)
  end

  scenario "user searches by Album" do
    
    visit root_path
    fill_in :album, with: "Adele 21"
    click_button "Search"

    expect(page).to have_content(@song.title)
    expect(page).to have_content(@song.artist.name)
    expect(page).to have_content(@song.album.title)
  end

  scenario "fails to find by song title" do
    
    visit root_path
    fill_in :song, with: "Hello"
    click_button "Search"

    expect(page).to have_content("No matches found, please enter artist, song, or album")
  end
  
  scenario "fails to find by artist" do
    
    visit root_path
    fill_in :song, with: "Sting"
    click_button "Search"

    expect(page).to have_content("No matches found, please enter artist, song, or album")
  end

  scenario "fails to find by album" do
    
    visit root_path
    fill_in :song, with: "Traveller"
    click_button "Search"

    expect(page).to have_content("No matches found, please enter artist, song, or album")
  end

end
