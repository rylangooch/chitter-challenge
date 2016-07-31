module SessionHelpers

 def sign_in(email:, password:)
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up
   visit '/users/new'
   fill_in :email, :with => 'user@user.com'
   fill_in :name, :with => 'user'
   fill_in :username, :with => 'user1'
   fill_in :password, :with => 'user'
   fill_in :password_confirmation, :with => 'user'
   click_button 'Save user'
 end

end


# def sign_up(email: 'alice@example.com',
#             password: '12345678',
#             password_confirmation: '12345678')
#   visit '/users/new'
#   fill_in :email, with: email
#   fill_in :password, with: password
#   fill_in :password_confirmation, with: password_confirmation
#   click_button 'Sign up'
