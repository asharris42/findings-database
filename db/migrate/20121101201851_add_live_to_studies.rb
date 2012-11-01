class AddLiveToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :live, :boolean, :default => false
  end
end
