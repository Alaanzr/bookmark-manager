feature "user sign up" do
  scenario "user signs up with email and password" do
    visit('/signup')
    fill_in('username', :with => 'makers_username')
    fill_in('email', :with => 'makers@makersacademy.com')
    fill_in('password', :with => 'maker123')
    click_button('Sign Up')
    expect(page).to have_content('Welcome makers_username!')
    expect(User.first.email).to eq 'makers@makersacademy.com'
    expect(User.count).to eq 1
  end
end
