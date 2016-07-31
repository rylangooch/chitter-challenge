# feature 'Creating peeps' do
#
#   scenario 'I can create a new peep' do
#     sign_up
#     sign_in
#     visit '/peeps'
#     fill_in 'peep',   with: 'Chitter, I have arrived'
#     click_button 'Peep'
#     expect(current_path).to eq '/peeps'
#
#     within 'ul#peeps' do
#     expect(page).to have_content('CONDOTH1: This is an exciting test')
#     end
#   end
#
#   scenario "I can't create a peep without being logged in" do
#     visit '/peeps/new'
#     expect(page).to have_content 'Hi, please sign up or login to leave a peep'
#   end
# end
#
# feature 'Viewing peeps' do
#
#   scenario 'I can see existing peeps on the peeps page' do
#
#     Peep.create(message: 'Chitter, I have arrived', author: 'Rylan')
#
#     visit '/sessions/peeps'
#     expect(page.status_code).to eq 200
#
#     within 'ul#links' do
#       expect(page).to have_content('Makers Academy')
#     end
#   end
# end
