require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create an album path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    visit('/albums')
    save_and_open_page
    click_on('Add a New Album')
    fill_in('album_name', :with => 'Yellow submarine')
    click_on('Go!')
    expect(page).to have_content('Yellow submarine')
  end
end
describe('create a song path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    album = Album.new("Yellow Submarine", "Beatles", nil, "1920")
    album.save
    visit("/albums/#{album.id}")
    fill_in('song_name', :with => 'All You Need Is Love')
    click_on('Add song')
    expect(page).to have_content('All You Need Is Love')
  end
end
