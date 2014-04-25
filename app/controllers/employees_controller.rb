class EmployeesController < ApplicationController
  
  skip_before_action :require_login, only: [:new, :create]
  
  def new
    @employee = Employee.new
  end
  def index
    if(params[:employee_id])
      @selected_employee = Employee.find(params[:employee_id])
      @request_offs = Request_off.where( employee: @selected_employee )
    else
      @employees = Employee.all
    end
  end
  
    def edit
      @current_user = current_user
      @employee = Employee.find(params[:id])
      if @employee != @current_user
        redirect_to edit_employee_path(@current_user.id)
    end

  end

  def update
    @employee = Employee.find(params[:id])
 
    if @employee.update(params[:employee].permit(:password, :password_confirmation))
      flash[:notice] = "You have successfully updated your password"
      redirect_to request_offs_path
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save!
      flash.now.notice = "You have created an employee"
      session[:employee_id] = @employee.id
    else
      flash.now.notice = "You have Failed to create an Employee"
      redirect_to new_employee_path
    end
    redirect_to employees_path
  end
private
  def employee_params
    params.require(:employee).permit(:first_name, :middle_initial, :last_name, :email, :password, :password_confirmation)
  end
end
