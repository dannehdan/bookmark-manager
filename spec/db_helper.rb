def connect_test 
  con = PG.connect :dbname => 'bookmark_manager_test'
  list = con.exec "SELECT * FROM bookmarks"
end