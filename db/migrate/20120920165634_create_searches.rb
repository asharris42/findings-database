class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :description
      t.string :product
      t.string :platform
      t.string :study
      t.string :tag

      t.timestamps
    end
  end
end
