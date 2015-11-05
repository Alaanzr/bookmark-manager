feature "Adding tags" do
  scenario "When I add a new tag" do
    visit('/links/new')
    fill_in('add_title', with: 'Hello Kitty')
    fill_in('add_url', with: 'http://www.hellokitty.com')
    fill_in('add_tag', with: 'Kittens')
    click_button('Add Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Kittens')
  end
end
