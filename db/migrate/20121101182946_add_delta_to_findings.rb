class AddDeltaToFindings < ActiveRecord::Migration
  def change
    add_column :findings, :delta, :boolean, :default => true,
    :null => false
  end
end
