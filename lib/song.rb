class Song
  attr_accessor :name, :artist_name
 
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song 
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song 
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name 
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      return self.create_by_name(name)
    else 
      return self.find_by_name(name)
   end
  end
  
  def self.alphabetical
    array = self.all
    array.sort do |song_element_1, song_element_2|
      song_element_1.name <=> song_element_2.name
    end
  end
  
  def self.new_from_filename(file_name)
    
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
