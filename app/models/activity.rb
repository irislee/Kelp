class Activity < ActiveRecord::Base
  CATEGORIES = ["Arts & crafts"]
  NEIGHBORHOODS = ["Upper East Side"]
  
  def self.categories
    CATEGORIES
  end

  def parse_tags(tags)
    self.category_list = tags.select{ |tag| CATEGORIES.include?(tag) }.join(",")
  end

  def categories
    puts category_list
    self.category_list.split(",")
  end
end
