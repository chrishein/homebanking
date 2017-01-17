require 'rails_helper'

feature 'Accounts page' do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:other_client) { create(:other_client) }

  context 'as a user' do
    scenario 'visit the home page lists corresponding accounts' do
      expect(Account.all.count).to eq(2)
      visit root_path
      login(user)
      expect(page).to have_content('Account 1')
      expect(page).not_to have_content('Account Other Client')
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

  context 'as an admin' do
    scenario 'visit the accounts page lists all accounts' do
      expect(Account.all.count).to eq(2)
      visit root_path
      login(admin)
      click_link 'Cuentas'
      expect(page).to have_content('Account 1')
      expect(page).to have_content('Account Other Client')
    end

    scenario 'list any account movements' do
      visit root_path
      login(admin)
      click_link 'Cuentas'
      click_link 'Account Other Client'
      expect(page).to have_content('Movimientos')
      expect(page).to have_content('Check Deposit')
      expect(page).to have_content('10.000')
    end
  end
end
