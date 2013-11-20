class AddCategoryListToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :category_list, :string
  end
end
