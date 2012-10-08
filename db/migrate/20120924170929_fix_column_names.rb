class FixColumnNames < ActiveRecord::Migration
	def change
    rename_column :products, :desciption, :description
    rename_column :platforms, :desciption, :description
  end

end
