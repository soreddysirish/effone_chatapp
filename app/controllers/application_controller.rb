class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_filter :check_for_blocking
  protect_from_forgery with: :exception
#  load_and_authorize_resource
  before_action :last_seen_at, if: proc { user_signed_in?}
  before_filter :banned?,only: [:check_for_blocking]

  rescue_from CanCan::AccessDenied do |exception|
   flash[:error] = "Access denied!"
   redirect_to root_url
 end

  private
  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      redirect_to root_path
      flash[:notice]="Your account is blocked peases contact system admin"
    end
  end

  def last_seen_at
    current_user.update_attribute(:last_sign_in_at, Time.now)
  end

  def check_for_blocking
    if user.blocked == true
      sign_out current_user
      redirect_to "root", notice: "your account hasbeen blocked please contact adminstrater"
    end
  end

end
