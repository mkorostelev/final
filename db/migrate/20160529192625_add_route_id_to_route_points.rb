class AddRouteIdToRoutePoints < ActiveRecord::Migration[5.0]
  def change
    add_column :route_points, :route_id, :integer
  end
end
