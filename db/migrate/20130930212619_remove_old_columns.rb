class RemoveOldColumns < ActiveRecord::Migration
  def change
    remove_column :scholars, :name, :string
    remove_column :scholars, :is_admin, :string
  end
end
