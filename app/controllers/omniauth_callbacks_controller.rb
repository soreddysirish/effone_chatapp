class OmniauthCallbacksController <Devise::OmniauthCallbacksController

  def github
     @user = User.from_omniauth(request.env["omniauth.auth"])
     if @user.persisted?
       sign_in_and_redirect @user,:event => :authentication, notice: "signed in"
     else
       session["devise.github_data"] = request.env["omniauth.auth"]
        redirect_to new_user_url
     end
   end

   def linkedin
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user,:event => :authentication, notice: "signed in"
      else
        session["devise.linkedin_data"] = request.env["omniauth.auth"]
         redirect_to new_user_url
      end
    end

  #  def provider
  #    @user=User.from_omniauth(request.env["omniauth.auth"])
  #    if @user.persisted?
  #      sign_in_and_redirect @user,:event => :authentication,notice: "success"
  #    else
  #      session["devise.#{provider}_data"]=request.env["omniauth.auth"]
  #      redirect_to new_user_url
  #    end
  #  end
  #  alias_method :github, :provider
  #  alias_method :linkedin, :provider

end
