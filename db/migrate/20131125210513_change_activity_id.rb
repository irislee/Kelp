class ChangeActivityId < ActiveRecord::Migration
  def change
    rename_column(:reviews, :activities_id, :activity_id)
  end
end
