class RequestOffsController < ApplicationController

  def index
    @employees = Employee.all
    @current = current_user
    if( @current.is_admin? )
      if( params[:employee_id] )
        @selected_employee = Employee.find( params[:employee_id] )
        @request_off = @selected_employee.request_off
      else
        @request_offs = Request_off.all
      end
    else
      @request_off = Request_off.where("employee_id = ?", current_user.id)      
    end
  end
  
  def new
    @request_off = Request_off.new
  end
  
  def edit
    @request_response = Request_off.find(params[:id])
  end
  
  def update
    @request_response = Request_off.find(params[:id])
        
    if @request_response.update(params[:request_off].permit(:admin_comment, :request_response, :vacation_type))
      flash[:notice] = "You have successfully updated a request"
      redirect_to request_offs_path
    else
      
    end
  end
  
  def create
    @current = current_user

    if !@current
      redirect_to sessions_path
    end
    @request_off = Request_off.new
    @request_off.requested_date = params[:request_off][:requested_date]
    @request_off.comment = params[:request_off][:comment]
    @request_off.created_at = Time.now 
    @request_off.employee_id = @current.id
    @request_off.vacation_type = params[:request_off][:vacation_type]
    @request_off.save
        
    if @request_off.save
     flash[:notice] = "You have successfully requested a day off."
      redirect_to request_offs_path(current_user)
    else
      flash[:notice] = "You may only request a specific day once"
      render 'new'
    end
    
  end
end
