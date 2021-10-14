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

<<<<<<< HEAD
    con.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1,$2);", [url, title])
=======
    con.exec_params(
      "INSERT INTO bookmarks (url, title) VALUES ($1, $2);", [url, title]
    )
>>>>>>> 57369723cf33655ea4edddab0dc945251930d308
  end
end
 