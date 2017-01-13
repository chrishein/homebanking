module  UserHelper
  def login(a)
    visit root_path
    fill_in 'user[email]', with: a.email
    fill_in 'user[password]', with: a.password
    click_button 'Iniciar sesión'
  end

  def logout
    visit destroy_user_session_path
  end
end
