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

  def self.create(url)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    con.exec "INSERT INTO bookmarks (url) VALUES ('#{url}')"
  end
end
