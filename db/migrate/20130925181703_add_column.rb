class AddColumn < ActiveRecord::Migration
  def change
    add_column :scholars, :is_admin, :string
    add_column :scholars, :last_name, :string
    add_column :scholars, :first_name, :string

    remove_column :scholars, :full_name, :string
  end
end
