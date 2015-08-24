module AuthenticationHelper
  def logged_in_with(email, password)
    create(:admin_user, email: email)
    login_with(email, password)
  end

  def login_with(email, password)
    visit admin_login_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Login'
  end
end
