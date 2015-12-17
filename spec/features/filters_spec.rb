feature "filtering tags" do

before(:each) do
  Link.create(title: 'Twitter', url: 'www.twitter.com', tags: [Tag.first_or_create(tag: 'Social')])
  Link.create(title: 'BubbleShop', url: 'www.bubbleshop.com', tags: [Tag.first_or_create(tag: 'bubbles')])
  Link.create(title: 'Bubbleland', url: 'www.bubbleland.com', tags: [Tag.first_or_create(tag: 'bubbles')])
end

  scenario "filter for bubbles" do
    visit ('/links/index')
    fill_in('filter', :with => 'bubbles')
    click_button('Submit')
    # tag = Tag.first
    # expect(tag.links.map(&:title)).to include('BubbleShop')
    expect(page).to_not have_content('Twitter')
    expect(page).to have_content('BubbleShop')
    expect(page).to have_content('Bubbleland')
  end
end
