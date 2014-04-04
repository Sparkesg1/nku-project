class SessionsController < ApplicationController
  def index
    @current_user = current_user
    if( @current_user != nil )
      redirect_to employees_path
    end
    @employee = Employee.new
    
  end
  
  def create
    @employee = Employee.find_by_email(params[:employee][:email])
    
    if( @employee && @employee.authenticate( params[:employee][:password] ) )
      session[:employee_id] = @employee.id
      redirect_to employees_path
    else
      @employee = Employee.new
      flash.now.notice = "Invalid email or password"
      render 'index'
    end
  end
  
def logout
    session[:employee_id] = nil
    redirect_to sessions_path
  end
end
