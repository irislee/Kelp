class Activity < ActiveRecord::Base
  CATEGORIES = ["Arts & crafts"]
  NEIGHBORHOODS = [
    "Upper East Side", 
    "Upper West Side", 
    "West Village", 
    "Chelsea", 
    "Harlem", 
    "Midtown", 
    "Lower East Side", 
    "Soho", 
    "East Village", 
    "Chelsea", 
    "Midtown West", 
    "Lower East Side"]
  
  def self.categories
    CATEGORIES
  end

  def self.neighborhoods
    NEIGHBORHOODS
  end

  def parse_tags(tags)
    self.category_list = tags.select{ |tag| Activity.categories.include?(tag) }.join(",")
    self.neighborhood = tags.select{ |tag| Activity.neighborhoods.include?(tag) }.first
  end

  def categories
    self.category_list.split(",")
  end

end
