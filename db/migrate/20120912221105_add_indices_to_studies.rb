class AddIndicesToStudies < ActiveRecord::Migration
  def change
  	add_index :studies, :date
  	add_index :studies, :product
  	add_index :studies, :platform
  end
end
