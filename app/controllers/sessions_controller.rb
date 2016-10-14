class SessionsController < ApplicationController

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to dashboard_user_path current_user
      else
        redirect_to login_path(flash[:danger] = 'invaild email/password combination')
      end
    else
      redirect_to login_path(flash[:danger] = 'invaild email/password combination')
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
