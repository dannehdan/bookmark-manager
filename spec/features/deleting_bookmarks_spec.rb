require './lib/bookmarks'

feature 'Deleting bookmarks' do
  scenario 'user deletes a bookmark' do
    visit('/')
    fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://www.facebook.com/'
    click_button('Add bookmark')

    visit('/bookmarks')
    bookmark_id = "#delete-#{Bookmarks.all.last.id}"
    page.find(bookmark_id).click
    expect(page).not_to have_content('Facebook')
  end
end
