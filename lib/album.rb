class Album
  attr_reader :name, :artist, :id, :year #Our new save method will need reader methods.

  @@albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an ALbum is added.

  def initialize(name, artist, id, year) # We've added id as a second parameter.
    @name = name.capitalize
    @artist = artist.capitalize
    @id = id || @@total_rows += 1  # We've added code to handle the id.
    @year = year.capitalize
  end


  def self.all
    @@albums.values
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.artist, self.id, self.year)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.search(x)
    @@albums.values.select { |e| /#{x}/i.match? e.name}
  end

  def self.sorter
    @@albums.values.sort_by { |album| album.name}
  end

  def songs
      Song.find_by_album(self.id)
    end
end
