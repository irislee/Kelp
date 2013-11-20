class AddNeighborhoodToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :neighborhood, :string
  end
end
