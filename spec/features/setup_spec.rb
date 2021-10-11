feature 'Testing' do
  scenario 'Page loads Hello World' do
    visit('/')
    expect(page).to have_content("Hello World")
  end
end