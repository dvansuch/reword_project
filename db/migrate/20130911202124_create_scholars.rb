class CreateScholars < ActiveRecord::Migration
  def change
    create_table :scholars do |t|
      t.string :name
      t.string :password_digest
      t.string :username
      t.string :email
      t.boolean :student

      t.timestamp
    end
  end
end
