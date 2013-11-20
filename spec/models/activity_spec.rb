require_relative '../spec_helper'

describe Activity do
  it "parses categories from tags" do
    tag_list = [
    "Dance",
    "Play spaces",
    "Art",
    "New York",
    "West Village",
    "Birthday parties",
    "General interest",
    "Arts & crafts",
    "Sports & rec",
    "Birthday party venue"
    ]
    activity = Activity.new
    activity.parse_tags(tag_list)
    activity.categories.should include("Arts & crafts")
  end
end