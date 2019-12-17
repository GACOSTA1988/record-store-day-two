require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  if params["search"]
    @albums = Album.search(params[:search])
  elsif
    params["sort"]
    @albums = Album.sorter
  else
    @albums = Album.all
  end
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums') do
  @albums = Album.all.sorter
  erb(:albums)
end


post('/albums') do
  name = params[:album_name]
  artist = params[:artist_name]
  year = params[:year]
  album = Album.new(name, artist, nil, year)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end
