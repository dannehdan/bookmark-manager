require './lib/bookmarks'

describe Bookmarks do
  it 'should return a list of bookmarks' do
    expect(described_class.all).to eq(["Google - google.com", "Facebook - facebook.com"])
  end
end