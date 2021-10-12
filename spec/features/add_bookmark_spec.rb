feature 'Adding bookmarks' do
  scenario 'a user adds a bookmark' do
    visit('/')
    fill_in :url, with: 'http://www.facebook.com/'
    click_button('Add bookmark')
    visit('/bookmarks')
    expect(page).to have_content('http://www.facebook.com/')
  end
end