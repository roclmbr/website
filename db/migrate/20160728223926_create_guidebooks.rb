class CreateGuidebooks < ActiveRecord::Migration
  def change
    create_table :guidebooks do |t|
      t.string :name
      t.string :description
      t.string :grade
      t.string :fa
      t.string :date
      t.integer :length
      t.string :gear

      t.timestamps null: false
    end
  end
end
