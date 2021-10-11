feature 'View bookmark list' do
  scenario 'Page lists saved bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content(
      "Google - google.com,\nFacebook - facebook.com"
    )
  end
end