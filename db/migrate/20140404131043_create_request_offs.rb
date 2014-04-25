class CreateRequestOffs < ActiveRecord::Migration
  def change
    create_table :request_offs do |t|
      t.integer     :employee_id
      t.date        :requested_date
      t.string      :comment
      t.string      :request_response, default: 'Pending'
      t.timestamps
    end
  end
end
