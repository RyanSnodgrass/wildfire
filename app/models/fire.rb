class Fire < ActiveRecord::Base
	belongs_to :location
	def self.search(query)
	where("started_by like ?", "%#{query}%")
	#where('locations.state = ?', "%#{query}%")
	end
	#   where('started_by LIKE ? OR acres LIKE ? or state LIKE ?', "%#{query}%", "%#{query}%", "#{query}%")
	#   # Patient.joins(:doctor).where(‘doctors.speciatly = ?’, “podiatry")
	#   # find(:all, :conditions => ['started_by LIKE ?', search_condition])

	# end
	# def search(query)
	# 	# @results= Fire.joins(:location).where('locations.state = ?', "%#{query}%")
	# end
	
end
