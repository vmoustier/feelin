class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  helper_method :require_admin
  
  def require_admin
    if (current_user.role_id != 2)
      flash[:danger] = "You need to be admin to perform those action!"
      redirect_to root_path
    end
  end
end
