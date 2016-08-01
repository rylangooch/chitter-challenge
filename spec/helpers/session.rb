module SessionHelpers

 def sign_in(email: 'test@test.com', password: 'test 2')
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up
   visit '/users/new'
   fill_in :email, :with => 'user@example.com'
   fill_in :name, :with => 'user'
   fill_in :username, :with => 'user1'
   fill_in :password, :with => 'password'
   fill_in :password_confirmation, :with => 'password'
   click_button 'Save user'
 end

end
