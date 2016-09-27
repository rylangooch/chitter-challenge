require_relative '../helpers/session.rb'

feature 'user sign up' do
  scenario 'storing a user profile' do
    sign_up
    expect(page).to have_content 'Welcome, User'
    expect(User.first.email).to eq('user@user.com')
  end

  scenario 'user enters mismatching passwords' do
    expect { register(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Please refer to the following errors below: Password does not match the confirmation')
  end

  scenario 'user registers with no email address' do
     expect { register(email: nil) }.not_to change(User, :count)
     expect(current_path).to eq('/users')
     expect(page).to have_content('Email must not be blank')
   end

   scenario 'user enters invalid email address' do
      expect { register(email: 'usercom') }.not_to change(User, :count)
      expect(current_path).to eq('/users')
      expect(page).to have_content('Email has an invalid format')
    end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing username' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username is already taken')
  end

  def register(email: 'user@user.com', password: 'user', password_confirmation: 'user')
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button 'Save user'
  end
end
