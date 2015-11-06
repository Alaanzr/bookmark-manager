feature "creating a new user" do
  scenario "when a user signs up to the service" do
    visit('/')
    fill_in('username', with: 'David')
    fill_in('email', with: 'David@gmail.com')
    fill_in('password', with: 'David1234')
    fill_in('password_confirmation', with: 'David1234')
    click_button('Sign Up')
    expect(page).to have_content('Welcome David!')
    p User.first
    p User.email
    expect(User.first.email).to eq 'David@gmail.com'
    expect(User.count).to eq 1
  end
end
