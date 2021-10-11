feature 'Viewing bookmarks' do
  scenario 'Page loads index page' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end