# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'net/http'
require 'json'


# seed activities table
i = 1
allresults = []

4.times do
  url = "http://www.timeout.com/new-york-kids/search.json?page_size=25&order=relevance&nodes%5B0%5D=2073&keyword=&location=200&locationText=&section=&locationRadius=0&_section_search=&expand=&page=#{i}&_source="
  resp = Net::HTTP.get_response(URI.parse(url))
  data = resp.body
  result = JSON.parse(data)
  result["response"]["results"].each do |activity|
    allresults << activity
  end
  i += 1
end

allresults.each do |activity|
  new_activity = Activity.where(
  :name => activity["name"], 
  :location => activity["address1_s"], 
  :blurb => activity["annotation"], 
  :url => activity["url_s"],
  :image => activity["image_id_i"].to_s
  ).first_or_create
  
  if !activity["suggest_tags"].nil?
    new_activity.parse_tags(activity["suggest_tags"])
    new_activity.save
  end
end

User.create(:name => "Margaret", :password => "coffee", :password_confirmation => "coffee" )
User.create(:name => "Iris", :password => "human", :password_confirmation => "human")
User.create(:name => "Scott", :password => "cheer", :password_confirmation => "cheer")
User.create(:name => "Avi", :password => "chai", :password_confirmation => "chai" )
User.create(:name => "Spencer", :password => "magic", :password_confirmation => "magic")
User.create(:name => "Jonathan", :password => "pigeon", :password_confirmation => "pigeon")

#REVIEW 1
Activity.find_by(:id => 1).reviews.create(:user_id => 1, :review_text => "This is great! I love taking my kids here.", :activity_id => 1)
Activity.find_by(:id => 1).ratings.create(:user_id => 1, :score => 4, :activity_id => 1)
Review.find_by(:id => 1).votes.create(votable_id: 1, votable_type: "Review", voter_id: 6, voter_type: "User", vote_flag: true)
Review.find_by(:id => 1).votes.create(votable_id: 1, votable_type: "Review", voter_id: 3, voter_type: "User", vote_flag: false)

#REVIEW 2
Activity.find_by(:id => 1).reviews.create(:user_id => 3, :review_text => "Picked up the new Saige doll and 'The Smart Girl's Guide to Boys'!", :activity_id => 1)
Activity.find_by(:id => 1).ratings.create(:user_id => 3, :score => 5, :activity_id => 1)
Review.find_by(:id => 2).votes.create(votable_id: 1, votable_type: "Review", voter_id: 1, voter_type: "User", vote_flag: true)
Review.find_by(:id => 2).votes.create(votable_id: 1, votable_type: "Review", voter_id: 4, voter_type: "User", vote_flag: true)

#REVIEW 3
Activity.find_by(:id => 2).reviews.create(:user_id => 4, :review_text => "Had a really fun time here with my niece on Sunday.", :activity_id => 2)
Activity.find_by(:id => 2).ratings.create(:user_id => 4, :score => 4, :activity_id => 1)
Review.find_by(:id => 3).votes.create(votable_id: 1, votable_type: "Review", voter_id: 1, voter_type: "User", vote_flag: true)
Review.find_by(:id => 3).votes.create(votable_id: 1, votable_type: "Review", voter_id: 3, voter_type: "User", vote_flag: false)

#REVIEW 4
Activity.find_by(:id => 3).reviews.create(:user_id => 4, :review_text => "Meh-not so great", :activity_id => 3)
Activity.find_by(:id => 3).ratings.create(:user_id => 4, :score => 2, :activity_id => 3)
Review.find_by(:id => 4).votes.create(votable_id: 1, votable_type: "Review", voter_id: 5, voter_type: "User", vote_flag: true)
Review.find_by(:id => 4).votes.create(votable_id: 1, votable_type: "Review", voter_id: 6, voter_type: "User", vote_flag: false)

#REVIEW 5
Activity.find_by(:id => 4).reviews.create(:user_id => 5, :review_text => "Awesome. 5 Stars. I'm a kid again!", :activity_id => 4)
Activity.find_by(:id => 4).ratings.create(:user_id => 5, :score => 5, :activity_id => 4)
Review.find_by(:id => 5).votes.create(votable_id: 1, votable_type: "Review", voter_id: 1, voter_type: "User", vote_flag: true)
Review.find_by(:id => 5).votes.create(votable_id: 1, votable_type: "Review", voter_id: 3, voter_type: "User", vote_flag: false)
Review.find_by(:id => 5).votes.create(votable_id: 1, votable_type: "Review", voter_id: 6, voter_type: "User", vote_flag: true)

#REVIEW 6
Activity.find_by(:id => 5).reviews.create(:user_id => 3, :review_text => "I love this place.  Thanks mom!!!!", :activity_id => 5)
Activity.find_by(:id => 5).ratings.create(:user_id => 3, :score => 5, :activity_id => 5)
Review.find_by(:id => 6).votes.create(votable_id: 1, votable_type: "Review", voter_id: 1, voter_type: "User", vote_flag: false)
Review.find_by(:id => 6).votes.create(votable_id: 1, votable_type: "Review", voter_id: 2, voter_type: "User", vote_flag: false)
Review.find_by(:id => 6).votes.create(votable_id: 1, votable_type: "Review", voter_id: 4, voter_type: "User", vote_flag: false)
Review.find_by(:id => 6).votes.create(votable_id: 1, votable_type: "Review", voter_id: 5, voter_type: "User", vote_flag: false)

#REVIEW 7
Activity.find_by(:id => 6).reviews.create(:user_id => 1, :review_text => "I got sick here. It smells.", :activity_id => 6)
Activity.find_by(:id => 6).ratings.create(:user_id => 1, :score => 1, :activity_id => 6)
Review.find_by(:id => 7).votes.create(votable_id: 1, votable_type: "Review", voter_id: 1, voter_type: "User", vote_flag: true)
Review.find_by(:id => 7).votes.create(votable_id: 1, votable_type: "Review", voter_id: 3, voter_type: "User", vote_flag: true)
Review.find_by(:id => 7).votes.create(votable_id: 1, votable_type: "Review", voter_id: 4, voter_type: "User", vote_flag: true)
Review.find_by(:id => 7).votes.create(votable_id: 1, votable_type: "Review", voter_id: 5, voter_type: "User", vote_flag: true)

#REVIEW 8
Activity.find_by(:id => 7).reviews.create(:user_id => 6, :review_text => "Very clean bathrooms.  I would go again.", :activity_id => 7)
Activity.find_by(:id => 7).ratings.create(:user_id => 6, :score => 4, :activity_id => 7)
Review.find_by(:id => 8).votes.create(votable_id: 1, votable_type: "Review", voter_id: 1, voter_type: "User", vote_flag: true)
Review.find_by(:id => 8).votes.create(votable_id: 1, votable_type: "Review", voter_id: 3, voter_type: "User", vote_flag: true)
Review.find_by(:id => 8).votes.create(votable_id: 1, votable_type: "Review", voter_id: 5, voter_type: "User", vote_flag: true)

#REVIEW 9
Activity.find_by(:id => 8).reviews.create(:user_id => 3, :review_text => "The other kids loved my bits!", :activity_id => 8)
Activity.find_by(:id => 8).ratings.create(:user_id => 3, :score => 5, :activity_id => 8)
Review.find_by(:id => 8).votes.create(votable_id: 1, votable_type: "Review", voter_id: 1, voter_type: "User", vote_flag: true)
Review.find_by(:id => 8).votes.create(votable_id: 1, votable_type: "Review", voter_id: 6, voter_type: "User", vote_flag: true)

#REVIEW 10
Activity.find_by(:id => 9).reviews.create(:user_id => 4, :review_text => "This is the most fun I've had in a week!", :activity_id => 9)
Activity.find_by(:id => 9).ratings.create(:user_id => 4, :score => 5, :activity_id => 9)
Review.find_by(:id => 10).votes.create(votable_id: 1, votable_type: "Review", voter_id: 3, voter_type: "User", vote_flag: true)
Review.find_by(:id => 10).votes.create(votable_id: 1, votable_type: "Review", voter_id: 5, voter_type: "User", vote_flag: true)
