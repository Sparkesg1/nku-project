class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end
  def index
    @employee = Employee.all
  end
  def show
  end
  def create
    @employee = Employee.new(params[:employee].permit(:first_name, :middle_initial, :last_name, :email, :password, :password_confirmation))
    @employee.save
    redirect_to employees_path
  end
private
  def employee_params
    params.require(:employee).permit(:first_name, :middle_initial, :last_name, :email, :password)
  end
end
