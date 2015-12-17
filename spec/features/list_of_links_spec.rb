feature 'list of links' do
  scenario 'list of links appears on homepage' do
    Link.create(title: 'Google', url: 'https://www.google.co.uk')
    visit('/links/index')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
