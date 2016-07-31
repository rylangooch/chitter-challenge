# require_relative 'helpers/session'

feature 'User signs out' do
  before(:each) do
    User.create(email: 'user@example.com',
                name: 'user',
                username: 'user1',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user@example.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, user')
  end

end
