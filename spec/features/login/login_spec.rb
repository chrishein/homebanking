require 'rails_helper'

feature 'Login page' do
  let(:user) {FactoryGirl.create(:user)}

  # Scenario: Visit the home page
  #   Given I am an unknown visitor
  #   When I visit the home page
  #   Then I see a login screen
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Iniciar sesión'
  end

  scenario 'visit the home page and sign in as user' do
    visit root_path
    expect(page).to have_content 'Iniciar sesión'
    login(user)
    expect(page).to have_content('Cuentas')
  end
end
