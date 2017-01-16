require 'rails_helper'

feature 'Accounts page' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'visit the home page as user lists accounts' do
    visit root_path
    login(user)
    expect(page).to have_content('Account 1')
  end

  scenario 'list account movements' do
    visit root_path
    login(user)
    click_link 'Account 1'
    expect(page).to have_content('Movimientos')
    expect(page).to have_content('Cash Deposit')
    expect(page).to have_content('15.000')
  end
end
