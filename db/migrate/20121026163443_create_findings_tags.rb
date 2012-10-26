class CreateFindingsTags < ActiveRecord::Migration
  def up
  	create_table :findings_tags, :id => false do |t|
      t.integer :finding_id
      t.integer :tag_id
    end
  end

  def down
  	drop_table :findings_tags
  end
end
