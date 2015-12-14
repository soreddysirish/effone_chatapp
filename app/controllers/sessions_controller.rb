class SessionsController < Devise::SessionsController
  def create
  #   if request.env["omniauth.auth"]
  #   session[:omniauth]=auth.except("extra")
  # end
    super
  end

  def destroy
    session[:omniauth]=nil
    session[:user_id]=nil
    current_user.update_attributes(status: false)
    super
  end
end
