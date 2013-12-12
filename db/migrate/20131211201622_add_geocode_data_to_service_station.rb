class AddGeocodeDataToServiceStation < ActiveRecord::Migration
  def change

    add_column :service_stations, :latitude, :float

    add_column :service_stations, :longitude, :float

  end
end
