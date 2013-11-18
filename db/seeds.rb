# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'net/http'
require 'json'

i = 1
allresults = []


# http = ActiveSupport::JSON.decode('http://www.timeout.com/new-york-kids/search.json?page_size=25&order=relevance&nodes%5B0%5D=2073&keyword=&location=200&locationText=&section=&locationRadius=0&_section_search=&expand=&page=1&_source=')
# result = ActiveSupport::JSON.decode(http)
# allresults << result

# my_hash = JSON.parse('http://www.timeout.com/new-york-kids/search.json?page_size=25&order=relevance&nodes%5B0%5D=2073&keyword=&location=200&locationText=&section=&locationRadius=0&_section_search=&expand=&page=1&_source=')
# puts my_hash["hello"] => "goodbye"

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
  Activity.where(
  :name => activity["name"], 
  :location => activity["address1_s"], 
  :blurb => activity["annotation"], 
  :url => activity["url_s"]
  ).first_or_create
end