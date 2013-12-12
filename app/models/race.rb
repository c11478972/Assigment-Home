class Race < ActiveRecord::Base
	belongs_to :service_station
	validates :racename, :dor, :vehicletype, :racetype, :location, :driverentryfee, :spectatorfee, presence: true
	validates :racename, uniqueness: true
	geocoded_by :fulladdress
	after_validation :geocode, :if => :address_changed?
	
	def self.search(search)
		search_condition = search + "%"
		find(:all, :conditions=>['racename LIKE ?', search_condition])
	end
	
	def must_have_valid_trailer#doesn't seem to work
		unless trailer.include?("<iframe")
			errors.add(:trailer, "Must have '<iframe' tag")
		end
	end 
	
	def fulladdress
		fulladdress = self.address + " " + self.location #How to get the location name
	end
end
