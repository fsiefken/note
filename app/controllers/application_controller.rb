class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  
  #before_action :authenticate_user!
  #protect_from_forgery with: :exception

  # Verify that controller actions are authorized. Optional.
  # after_filter :verify_authorized,  except: :index
  # after_filter :verify_policy_scoped, only: :index
 

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  # Enforces access right checks for individuals resources
  #after_filter :verify_authorized, :except => :index
 
  # Enforces access right checks for collections
  #after_filter :verify_policy_scoped, :only => :index
 
 
  private


  def user_not_authorized
    flash[:error] = "You are not authorized to view or edit this"
    redirect_to root_path
  end

end
