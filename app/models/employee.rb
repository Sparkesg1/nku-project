class Employee < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create 
  validates :password, length: { in: 6..20, message: 'Password must be between 6 and 20 characters long' } 
  validates_uniqueness_of :email, :on => :create
  has_many :request_offs
end
