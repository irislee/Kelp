class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  acts_as_votable
end
