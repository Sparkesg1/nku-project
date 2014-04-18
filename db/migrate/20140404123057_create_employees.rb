class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string   :first_name
      t.string   :middle_initial
      t.string   :last_name
      t.string   :email
      t.string   :password_digest
      t.boolean  :is_admin, default: false
      t.timestamps
    end
  end
end
