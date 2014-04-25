class Comment < ActiveRecord::Base
  belongs_to :request_off
  has_many :request_offs
end
