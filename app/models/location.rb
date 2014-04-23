class Location < ActiveRecord::Base
	has_many :fires
	# def self.search(query)
	# Fire.joins(:location).where('locations.state = ?', "%#{query}%")
	# #where('locations.state = ?', "%#{query}%")
	# end
end
