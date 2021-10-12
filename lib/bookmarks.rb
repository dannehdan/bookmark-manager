require 'pg'

class Bookmarks

  # attr_reader :list
  
  def self.all
    con = PG.connect :dbname => 'bookmark_manager'
    list = con.exec "SELECT * FROM bookmarks"
    list.map { |bookmark| bookmark['url'] }
  end
end