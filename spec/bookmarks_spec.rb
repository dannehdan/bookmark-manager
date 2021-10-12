require './lib/bookmarks'

describe Bookmarks do
  it 'should return a list of bookmarks' do
    # Add the test data
    Bookmarks.create('http://www.makersacademy.com/')
    Bookmarks.create('http://www.destroyallsoftware.com/')
    Bookmarks.create('http://www.google.com/')

    bookmarks = Bookmarks.all

    expect(bookmarks).to include("http://www.makersacademy.com/")
    expect(bookmarks).to include("http://www.destroyallsoftware.com/")
    expect(bookmarks).to include("http://www.google.com/")
  end

  describe '#create' do
    it 'creates a new bookmark' do
      described_class.create('http://www.facebook.com')
      expect(described_class.all).to include('http://www.facebook.com')
    end
  end
end
