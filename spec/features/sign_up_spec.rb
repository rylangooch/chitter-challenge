feature 'User sign up' do
  scenario 'storing a user profile' do
   expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, Test'
    expect(User.first.email).to eq('test@test.com')
  end

  scenario 'user enters mismatching passwords' do
    expect { sign_up(password_confirmation: 'wrong_password') }.not_to change User, :count
    expect(current_path).to eq('/users')
    expect(page).to have_content('Please refer to the following errors below: Password does not match the confirmation')
  end

  scenario 'user registers with no email address' do
    expect{ sign_up(email: '') }.not_to change User, :count
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
   end

   scenario 'user enters invalid email address' do
      expect { sign_up(email: 'usercom') }.not_to change(User, :count)
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
end
