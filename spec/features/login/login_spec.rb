require 'rails_helper'

feature 'Login page' do
  # Scenario: Visit the home page
  #   Given I am an unknown visitor
  #   When I visit the home page
  #   Then I see a login screen
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Iniciar sesión'
  end
end
