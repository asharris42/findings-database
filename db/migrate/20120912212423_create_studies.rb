class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :study_name
      t.date :study_date
      t.string :product
      t.string :platform
      t.text :description
      t.text :participants
      t.string :presentation
      t.string :researcher
      t.string :designer

      t.timestamps
    end
  end
end
