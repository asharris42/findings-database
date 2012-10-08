class CreateProductsStudies < ActiveRecord::Migration
  def up
  	create_table :products_studies, :id => false do |t|
      t.integer :product_id
      t.integer :study_id
    end
  end

  def down
  	drop_table :products_studies
  end
end
