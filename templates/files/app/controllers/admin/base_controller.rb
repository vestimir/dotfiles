class Admin::BaseController < ApplicationController
  PER_PAGE = 25

  before_action :authorize

  protect_from_forgery with: :exception
  layout 'admin/application'

  private

  def current_user
    @current_user ||= Account.find(session[:account_id]) if session[:account_id]
  end
  helper_method :current_user

  def authorize
    redirect_to admin_login_url unless current_user
  end
end
