feature 'User sign in' do
  let!(:user) do
    User.create(email: 'user@example.com',
                name: 'user',
                username: 'user1',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    sign_in(user)
    expect(page).to have_content "Welcome, User"
  end
end
