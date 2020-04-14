require 'pry'

class Song
  
  @@all = []
  
  attr_accessor :name
  attr_reader :artist
  
  def initialize(name, artist = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end
  
  
end