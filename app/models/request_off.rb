class Request_off < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: :requested_date, message: "Can only attend one class per day"}, presence: true
  
  def old
    @request_response = Request_Off.request_date
    if @request_response < Date.today
      @old == true
    else
      @old == false
    end
  end
end
