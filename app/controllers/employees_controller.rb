class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end
  def index
    @employees = Employee.all
  end
  def show
  end
  def create
    @employee = Employee.new(employee_params)
    if @employee.save!
      flash.now.notice = "You have created an employee"
    else
      flash.now.notice = "You have Failed to create an Employee"
    end
    redirect_to employees_path
  end
private
  def employee_params
    params.require(:employee).permit(:first_name, :middle_initial, :last_name, :email, :password, :password_confirmation)
  end
end
