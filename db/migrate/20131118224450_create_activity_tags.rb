class CreateActivityTags < ActiveRecord::Migration
  def change
    create_table :activity_tags do |t|
      t.integer :tag_id
      t.integer :activity_id

      t.timestamps
    end
    add_index :activity_tags, :tag_id
  end
end
