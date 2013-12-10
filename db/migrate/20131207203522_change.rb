class Change < ActiveRecord::Migration
  def self.up
  change_column :races, :circutmap, :string
  end

  def self.down
  change_column :races, :image, :string
  end
end
