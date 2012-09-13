class FixStudyColumnNames < ActiveRecord::Migration
  def change 
  	rename_column :studies, :study_name, :name
  	rename_column :studies, :study_date, :date
  end
end
