class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :description
      t.string :grade
      t.string :fa
      t.string :date
      t.integer :length
      t.string :gear
    end
  end
end
