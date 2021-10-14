require 'pg'

class Bookmarks
  
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end

    bookmarks = con.exec "SELECT * FROM bookmarks ORDER BY id ASC;"
    bookmarks.map { |bookmark| 
      
      Bookmarks.new(
        url: bookmark['url'], 
        title: bookmark['title'],
        id: bookmark['id']
      )
    }
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end

    con.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1,$2);", [url, title])
  end

  def self.delete(id)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end
    p id

    con.exec_params("DELETE FROM bookmarks WHERE id=$1;", [id[:id].to_i])
  end
end
 