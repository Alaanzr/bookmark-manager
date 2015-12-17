feature "adding multiple tags to link" do
  scenario "adding several tags to a link" do
    visit ('/links/new')
    fill_in('url', :with => 'www.facebook.com')
    fill_in('title', :with => 'Facebook')
    fill_in('tag1', :with => 'Social')
    fill_in('tag2', :with => 'Friends')
    fill_in('tag3', :with => 'Time wasting')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:tag)).to include('Social')
    expect(link.tags.map(&:tag)).to include('Friends')
    expect(link.tags.map(&:tag)).to include('Time wasting')
  end
end
