class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :require_login
  def current_user
    if( session[:employee_id] == nil )
      return nil
    end
    return Employee.find( session[:employee_id] )
  end
  helper_method :current_user
  
  def require_login
    if current_user == nil
      flash[:error] = "You must be logged"
      redirect_to sessions_path
    end
  end
        
end
