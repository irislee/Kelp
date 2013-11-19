class ActivityTags < ActiveRecord::Base
	belongs_to :activity
	belongs_to :tags
end
