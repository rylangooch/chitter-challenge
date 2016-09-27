module Helpers
  def sign_up(name: 'test',
            username: 'test',
            email: 'test@test.com',
            password: 'password',
            password_confirmation: 'password')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Save user'
  end

  def sign_in(user)
     visit '/sessions/new'
     fill_in :email, with: user.email
     fill_in :password, with: user.password
     click_button 'Sign in'
  end
end
