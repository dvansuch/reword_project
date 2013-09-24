class CreateScholars < ActiveRecord::Migration
  def change
    create_table :scholars do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :password_digest
      t.string  :username
      t.string  :email
      t.boolean :student
      t.boolean :is_admin
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamp
    end
  end
end