class AddDeltaToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :delta, :boolean, :default => true,
    :null => false
  end
end
