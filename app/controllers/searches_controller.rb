class SearchesController < ApplicationController

  def index

    if search_params['song'].present?
      @songs = Song.search(search_params['song'])

      if search_params['artist'].present?
        @artist = Artist.search(search_params['artist'])
        @songs = @songs.joins(:artist).where('artist_id' => @artist)
      
        if search_params['album'].present?
          @album = Album.search(search_params['album'])
          @songs =@songs.joins(:album).where('album_id' => @album)
        end
      
      elsif search_params['album'].present?
        @album = Album.search(search_params['album'])
        @songs = @songs.joins(:album).where('album_id' => @album)
      end
   
    elsif search_params['artist'].present?
      @artist = Artist.search(search_params['artist'])
      @songs = Song.joins(:artist).where('artist_id' => @artist)
      

      if search_params['album'].present?
        @album = Album.search(search_params['album'])
        @songs = @songs.joins(:album).where('album_id' => @album)
      end
    
    else search_params['album'].present?
        @album = Album.search(search_params['album'])
        @songs = Song.joins(:album).where('album_id' => @album)
    end
    @songs= @songs.order("title").page(params[:page]).per(20)
  end


  protected
  def search_params
    params.permit(:artist, :song, :album)
  end
end
