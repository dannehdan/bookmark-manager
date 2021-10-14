require 'pg'

class Bookmarks
  
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    con = Bookmarks.connect
    bookmarks = con.exec "SELECT * FROM bookmarks ORDER BY id ASC;"
    bookmarks.map do |bookmark| 
      Bookmarks.new(
        url: bookmark['url'], 
        title: bookmark['title'],
        id: bookmark['id']
      )
    end
  end

  def self.create(url, title)
    con = Bookmarks.connect
    con.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1,$2);", [url, title])
  end

  def self.delete(id)
    con = Bookmarks.connect
    con.exec_params("DELETE FROM bookmarks WHERE id=$1;", [id[:id].to_i])
  end

  def self.connect 
    db_name = ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    return PG.connect dbname: db_name
  end
end
