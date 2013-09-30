class RenameColumnAdmin < ActiveRecord::Migration
  def change
    rename_column :scholars, :is_admin2, :is_admin
  end
end
