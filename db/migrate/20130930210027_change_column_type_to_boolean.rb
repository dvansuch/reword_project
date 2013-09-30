class ChangeColumnTypeToBoolean < ActiveRecord::Migration
  def change
    add_column :scholars, :is_admin2, :boolean

  end
end
