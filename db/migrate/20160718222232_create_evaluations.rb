class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
