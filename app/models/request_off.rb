class Request_off < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: :requested_date, message: "Can only attend one class per day"}, presence: true
end
