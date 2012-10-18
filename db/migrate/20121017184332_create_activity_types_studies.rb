class CreateActivityTypesStudies < ActiveRecord::Migration
  def up
  	create_table :activity_types_studies, :id => false do |t|
      t.integer :activity_type_id
      t.integer :study_id
    end
  end

  def down
  	drop_table :activity_types_studies
  end
end
