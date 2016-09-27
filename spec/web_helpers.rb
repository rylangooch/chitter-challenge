def sign_up
  visit '/users/new'
  fill_in :email, :with => 'user@user.com'
  fill_in :name, :with => 'user'
  fill_in :username, :with => 'user1'
  fill_in :password, :with => 'user'
  fill_in :password_confirmation, :with => 'user'
  click_button 'Save user'
end

def sign_in
  visit '/users/new'
  fill_in :email, :with => 'user@example.com'
  fill_in :password, :with => 'password'
  click_button 'Sign in'
end
