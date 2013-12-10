class AddGeocodeToRaces < ActiveRecord::Migration
  def change
    add_column :races, :longitude, :float

    add_column :races, :latitude, :float

  end
end
