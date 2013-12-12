class Customer < ActiveRecord::Base
	belongs_to :location
	has_many :vehicles
	has_many :journals
	has_many :posts, :dependent => :destroy
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :location_id, presence: true
	validates :email, uniqueness: true
	validates :email, format:{with: /\A([^@\s]+)@((?:[-a-z0+9]+\.)+[a-z]{2,})\Z/}
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	has_secure_password
	
	before_create { generate_token(:auth_token)}
	
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while Customer.exists?(column => self[column])
	end
end
