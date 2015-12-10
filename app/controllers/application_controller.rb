class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :last_seen_at, if: proc { user_signed_in?}

  private

  def last_seen_at
    current_user.update_attribute(:last_sign_in_at, Time.now)
  end



end
