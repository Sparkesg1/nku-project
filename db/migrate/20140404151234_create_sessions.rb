class CreateSessions < ActiveRecord::Migration
  def change
    create_table :current_users do |t|
      t.string :user_name
      t.string :password_digest
      t.timestamps
    end
  end
end
