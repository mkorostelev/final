class CreateRoutePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :route_points do |t|
      t.integer :number
      t.text :description

      t.timestamps
    end
  end
end
