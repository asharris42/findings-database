class AddIndexToStudiesCreatedAt < ActiveRecord::Migration
  def change
  	add_index :studies, :created_at
  end
end
