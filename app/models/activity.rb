class Activity < ActiveRecord::Base
	has_many :activity_tags
	has_many :tags, :through => :activity_tags	
end
