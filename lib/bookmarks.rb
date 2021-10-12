require 'pg'

class Bookmarks

  # attr_reader :list
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    list = con.exec "SELECT * FROM bookmarks"
    list.map { |bookmark| bookmark['url'] }
  end
end
