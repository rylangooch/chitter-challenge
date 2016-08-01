feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(peep: 'Chitter, I have arrived', author: 'Rylan')

    visit 'peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Chitter, I have arrived')
    end
  end
end
