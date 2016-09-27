feature 'Viewing peeps' do
  let!(:user) do
      User.create(email: 'user@example.com',
                name: 'user',
                username: 'user1',
                password: 'password',
                password_confirmation: 'password')
  end
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(text: 'Chitter, I have arrived', user: user)

    visit 'peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Chitter, I have arrived')
    end
  end
end
