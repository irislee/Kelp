class Activity < ActiveRecord::Base
  has_many :reviews
  has_many :ratings
  
  CATEGORIES = [
    "Arts & crafts",
    "Birthday parties",
    "Dance",
    "Sports & rec",
    "Science & technology"]
  NEIGHBORHOODS = [
    "Upper East Side", 
    "Upper West Side", 
    "West Village", 
    "Harlem", 
    "Midtown",  
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

  def average_rating
    if ratings.size == 0
      return 0
    else
      ratings.sum(:score) / ratings.size
    end
  end

end