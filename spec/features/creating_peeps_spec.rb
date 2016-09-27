require_relative '../web_helpers.rb'

feature 'Creating peeps' do
  before(:each) do
    User.create(email: 'user@example.com',
                name: 'user',
                username: 'user1',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'I can create a new peep' do
    visit '/peeps'
    click_button 'Sign in'
    # sign_in
    fill_in :email, :with => 'user@example.com'
    fill_in :password, :with => 'password'
    click_button 'Sign in'
    fill_in 'peep', with: 'Chitter, I have arrived'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
    expect(page).to have_content('Author: Peep: Chitter, I have arrived')
    end
  end

  scenario "I can't create a peep without being logged in" do
    visit '/peeps'
    expect(page).to have_content 'Hi, please sign up or login to leave a peep'
  end
end
