class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if( session[:employee_id] == nil )
      return nil
    end
    return Employee.find( session[:employee_id] )
  end
  helper_method :current_user
  
end
