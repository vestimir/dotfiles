class Admin::SessionsController < ApplicationController
  layout 'admin/login'

  def new
  end

  def create
    account = Account.find_by(email: params[:email])
    if account && account.authenticate(params[:password])
      session[:account_id] = account.id
      redirect_to admin_root_path
    else
      flash[:notice] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to login_path
  end
end
