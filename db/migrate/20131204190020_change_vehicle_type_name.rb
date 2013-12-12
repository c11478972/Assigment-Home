class ChangeVehicleTypeName < ActiveRecord::Migration
	def self.up
		rename_column :vehicles, :type, :vehicletype
	end

	def self.down
	end
end
