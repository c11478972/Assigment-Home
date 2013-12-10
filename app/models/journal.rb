class Journal < ActiveRecord::Base
	belongs_to :customer
	has_many :posts, :dependent => :destroy
end
