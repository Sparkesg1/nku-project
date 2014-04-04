class RequestOffsController < ApplicationController

  def index
    @request_off = Request_off.all
  end
  
  def new
    @request_off = Request_off.new
  end
  
  def create
    @request_off = Request_off.new
    @request_off.requested_date = params[:request_off][:requested_date]
    @request_off.created_at = Time.now 
    @request_off.save
        
    if @request_off.save
     flash[:notice] = "You have successfully requested a day off."
      redirect_to request_offs_path
    end
  end
  def show
    @request_off = Request_off.where("employee_id = ?", params[:id])
  end
end
