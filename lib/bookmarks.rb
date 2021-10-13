require 'pg'

class Bookmarks
 
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end

    list = con.exec "SELECT * FROM bookmarks"
    list.map { |bookmark| { url: bookmark['url'], title: bookmark['title'] } }
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end

    con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}','#{title}')"
  end
end
