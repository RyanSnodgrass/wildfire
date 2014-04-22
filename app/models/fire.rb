class Fire < ActiveRecord::Base
	belongs_to :location
	def self.search(query)
	  # where("started_by like ?", "%#{query}%")
	  where('started_by LIKE ? OR acres LIKE ?', "%#{query}%", "#{query}%")
	  # find(:all, :conditions => ['started_by LIKE ?', search_condition])
	end
end
