module Controllers
end

module Controllers::UserHelper
  def admin_logged
    user = create(:admin_user)
    session[:user_id] = user.id
  end

  def current_user
    Admin::User.find(session[:user_id])
  end
end
