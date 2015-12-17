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
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    super
  end
end
