feature 'Adding bookmarks' do
  scenario 'a user adds a bookmark' do
    visit('/')
    fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://www.facebook.com/'
    click_button('Add bookmark')
    visit('/bookmarks')
    expect(page).to have_content('Facebook')
  end
end