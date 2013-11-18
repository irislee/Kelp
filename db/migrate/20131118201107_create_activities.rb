class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.text :blurb
      t.string :url

      t.timestamps
    end
  end
end
