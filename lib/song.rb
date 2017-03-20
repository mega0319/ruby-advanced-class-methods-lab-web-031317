require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end


  def self.create
    new_instance = Song.new
    new_instance.save
    new_instance
  end

  def self.new_by_name(name)
    new_instance = Song.new
    new_instance.name = name
    new_instance
  end

  def self.create_by_name(name)
    new_instance = Song.new
    new_instance.name = name
    new_instance.save
    new_instance
  end

  def self.find_by_name(name)
    self.all.detect do |instance|
      instance.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |instance|
      instance.name
    end
  end

  def self.new_from_filename(full_song_name)
    artist = full_song_name.split(" - ")[0]
    song = full_song_name.split(" - ")[1].split(".")[0]
    new_instance = Song.new
    new_instance.name = song
    new_instance.artist_name = artist
    new_instance
  end

  def self.create_from_filename(full_song_name)
    artist = full_song_name.split(" - ")[0]
    song = full_song_name.split(" - ")[1].split(".")[0]
    new_instance = Song.new
    new_instance.name = song
    new_instance.artist_name = artist
    new_instance.save
    new_instance
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
