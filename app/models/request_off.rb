class Request_off < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: :requested_date, message: "You may only request a specific day once"}, presence: true

end
