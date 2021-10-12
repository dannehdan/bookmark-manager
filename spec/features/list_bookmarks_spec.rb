feature 'View bookmark list' do
  scenario 'Page lists saved bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com/', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com/', 'Destroy All Software');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com/', 'Google');")

    visit('/bookmarks')

    expect(page).to have_content("Destroy All Software")
    expect(page).to have_content("Google")
    expect(page).to have_content("Makers Academy")
  end
end
