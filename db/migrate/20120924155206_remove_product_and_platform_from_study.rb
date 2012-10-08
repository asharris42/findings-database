class RemoveProductAndPlatformFromStudy < ActiveRecord::Migration
  def up
    remove_column :studies, :product
    remove_column :studies, :platform
  end

  def down
    add_column :studies, :platform, :string
    add_column :studies, :product, :string
  end
end
