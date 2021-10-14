require './lib/bookmarks'

describe Bookmarks do
  it 'should return a list of bookmarks' do
    # Add the test data
    Bookmarks.create('http://www.makersacademy.com/', 'Makers Academy')
    Bookmarks.create('http://www.destroyallsoftware.com/', 'Destroy All Software')
    Bookmarks.create('http://www.google.com/', 'Google')

    bookmarks = Bookmarks.all

    expect(bookmarks.length).to eq(3)
    expect(bookmarks[0]).to be_instance_of(Bookmarks)
    expect(bookmarks[2].title).to eq('Google')
    # expect(bookmarks).to include( title: 'Makers Academy', url: 'http://www.makersacademy.com/' )
    # expect(bookmarks).to include({ title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com/' })
    # expect(bookmarks).to include({ title: 'Google', url: 'http://www.google.com/' })
  end

  describe '#create' do
    it 'creates a new bookmark' do
      described_class.create('http://www.facebook.com', 'Facebook')
      expect(described_class.all.last.title).to eq('Facebook')
    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      Bookmarks.create('http://www.makersacademy.com/', 'Makers Academy')
      id = Bookmarks.all.last.id
      Bookmarks.delete(id)
      expect(Bookmarks.all.length).to eq 0
    end
  end

  describe '#update' do
    it 'updates a bookmark title' do
      Bookmarks.create('http://www.makersacademy.com/', 'Makesr Academy')
      id = Bookmarks.all.last.id
      Bookmarks.update(id, 'Makers Academy')
      expect(Bookmarks.all[0].title).to eq 'Makers Academy'
    end
  end
end
