require 'csv'

CSV.foreach("#{Rails.root}/lib/seeds/songs_data.csv", headers: true) do |row|
  artist = Artist.find_or_create_by(name: row[1])
  album = Album.find_or_create_by(title: row[2], artist_id: artist.id)
  Song.find_or_create_by(title: row[0], album_id: album.id, artist_id: artist.id)
end
