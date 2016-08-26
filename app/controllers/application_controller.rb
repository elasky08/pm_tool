class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_session_path, alert: "Please sign in"
    end
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end
  helper_method :current_user
end
