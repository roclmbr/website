class CreateRouteCliffs < ActiveRecord::Migration
  def change
    create_table :route_cliffs do |t|
        t.integer :route_id
        t.integer :cliff_id   
    end
  end
end
