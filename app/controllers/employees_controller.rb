class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end
  def index
  end
  def show
  end
  def create
    @employee = Employee.new(params[:employee].permit(:first_name, :middle_initial, :last_name))
    @employee.save
  end
private
  def employee_params
    params.require(:employee).permit(:first_name, :middle_initial, :last_name)
  end
end
