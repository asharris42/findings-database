class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :platform_name
      t.text :desciption

      t.timestamps
    end
  end
end
