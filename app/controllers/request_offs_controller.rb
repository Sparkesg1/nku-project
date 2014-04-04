class RequestOffsController < ApplicationController

  def index
    @request_off = Request_off.all
  end
  
  def new
    @request_off = Request_off.new
  end
  
  def create
    @current = current_user
    
    @request_off = Request_off.new
    @request_off.requested_date = params[:request_off][:requested_date]
    @request_off.created_at = Time.now 
    @request_off.save
        
    if @request_off.save
     flash[:notice] = "You have successfully requested a day off."
    end
  end
  def show
    @request_off = Request_off.where("employee_id = ?", params[:id])
  end
end
