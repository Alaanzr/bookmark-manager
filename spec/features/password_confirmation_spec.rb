feature "Confirming a password" do
  scenario "When I input an invalid password confirmation" do
    visit('')
    visit('/')
    fill_in('username', with: 'David')
    fill_in('email', with: 'David@gmail.com')
    fill_in('password', with: 'David1234')
    fill_in('password_confirmation', with: 'David123')
    click_button('Sign Up')
    expect(User.count).to eq 0
    expect(page.current_path).to eq '/'
    expect(page).to have_content('Password and confirmation password do not match')
  end
end
