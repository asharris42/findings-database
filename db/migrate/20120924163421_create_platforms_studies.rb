class CreatePlatformsStudies < ActiveRecord::Migration
  def up
    create_table :platforms_studies, :id => false do |t|
      t.integer :platform_id
      t.integer :study_id
    end
  end
  def down
    drop_table :platforms_studies
  end
end
