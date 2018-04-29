class ApplicationController < ActionController::Base

  # protect_from_forgery with: :exception
  helper_method :current_person

  def current_person
    @current_person = if session[:user_id] then Person.find(session[:user_id]) else nil end 
  end
  # before_action :check_profile
  # skip_before_action :check_profile, only: [:destroy]
  #
  # private
  # def check_profile
  #  # byebug
  #   if user_signed_in? && current_user.classification.nil?
  #     flash[:notice] = "Tell us more about you..."
  #     redirect_to edit_user_path(current_user)
  #   end
  # end
  #
  # def check_admin
  #   if user_signed_in?
  #     current_user.admin
  #   end
  # end
end
