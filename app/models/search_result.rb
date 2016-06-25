class SearchResult
  attr_reader :query

  def initialize(search_params)
    @artist = search_params['artist']
    @song = search_params['song']
    @album = search_params['album']
  end

  def songs
    results = []
    Song.search(@song).each{ |song| results << song }
    results
  end

end
