class ChangeVehicleTypeName < ActiveRecord::Migration
  def self.up
  change_column :vehicles, :vehicletype, :string
  end

  def self.down
  change_column :vehicles, :type, :string
  end
end
