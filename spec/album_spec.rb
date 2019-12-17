require 'rspec'
require 'album'

# describe '#Album' do
#   before(:each) do
#     Album.clear()
#   end
#   describe('.all') do
#     it("returns an empty array when there are no albums") do
#       expect(Album.all).to(eq([]))
#     end
#   end

  describe('#save') do
    it("tests if albums are beings sorted alphbetically") do
      album = Album.new("b", "test", nil, "1999") # nil added as second argument
      album.save()
      album2 = Album.new("a", "test", nil, "1999") # nil added as second argument
      album2.save()
      album3 = Album.new("c", "test", nil, "1999") # nil added as second argument
      album3.save()
      expect(Album.sorter).to(eq([album2, album, album3]))
    end
  end

#   describe('#==') do
#     it("is the same album if it has the same attributes as another album") do
#       album = Album.new("Blue", nil)
#       album2 = Album.new("Blue", nil)
#       expect(album).to(eq(album2))
#     end
#   end
#   describe('.clear') do
#     it("clears all albums") do
#       album = Album.new("Giant Steps", nil)
#       album.save()
#       album2 = Album.new("Blue", nil)
#       album2.save()
#       Album.clear()
#       expect(Album.all).to(eq([]))
#     end
#   end
#   describe('.find') do
#     it("finds an album by id") do
#       album = Album.new("Giant Steps", nil)
#       album.save()
#       album2 = Album.new("Blue", nil)
#       album2.save()
#       expect(Album.find(album.id)).to(eq(album))
#     end
#   end
#   describe('#update') do
#   it("updates an album by id") do
#     album = Album.new("Giant Steps", nil)
#     album.save()
#     album.update("A Love Supreme")
#     expect(album.name).to(eq("A Love Supreme"))
#   end
# end
# describe('#delete') do
#     it("deletes an album by id") do
#       album = Album.new("Giant Steps", nil)
#       album.save()
#       album2 = Album.new("Blue", nil)
#       album2.save()
#       album.delete()
#       expect(Album.all).to(eq([album2]))
#     end
#   end
#   describe('.search_album') do
#       it("seaches an album by name") do
#         album = Album.new("Giant Steps", nil, "test")
#         album.save()
#         expect(Album.search("Giant Steps")).to(eq([album]))
#       end
#     end
# end
