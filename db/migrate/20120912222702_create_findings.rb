class CreateFindings < ActiveRecord::Migration
  def change
    create_table :findings do |t|
      t.text :content
      t.integer :study_id

      t.timestamps
    end
    add_index :findings, [:study_id, :content]
  end
end
