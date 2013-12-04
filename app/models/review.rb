class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  validates :review_text, :presence => true
  acts_as_votable 

end
