feature "Viewing bubbles tag" do

  before(:each) do
    Link.create(title: 'Powerpuff Girls', url: 'http://www.powerpuffgirls.com', tags: [Tag.create(name: 'Bubbles')])
  end

  scenario "When I visit /tags/bubbles" do
    # tag = Tag.create(name: 'Bubbles')
    # link.tags << tag
    # link.save
    visit('/tags/bubbles')
      expect(page).to have_content('Bubbles')
  end
end
