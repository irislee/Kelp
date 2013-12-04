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
Activity.find_by(:id => 1).reviews.create(:user_id => 1, :review_text => "This is great! I love taking my kids here.", :activity_id => 1)
Activity.find_by(:id => 1).ratings.create(:user_id => 1, :score => 3, :activity_id => 1)
Review.find_by(:id => 1).votes.create(votable_id: 1, votable_type: "Review", voter_id: 2, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 0)
Review.find_by(:id => 1).votes.create(votable_id: 1, votable_type: "Review", voter_id: 3, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 0)


