require_relative '../spec_helper'

describe Activity do
  let(:tag_list) {[
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
    ]}

  it "parses categories from tags" do
    activity = Activity.new
    activity.parse_tags(tag_list)
    activity.categories.should include("Arts & crafts")
  end

  it "parses neighborhood from tags" do
    activity = Activity.new
    activity.parse_tags(tag_list)
    activity.neighborhood.should eq("West Village")
  end
end