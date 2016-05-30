class AddPerformerIdToRoutePoints < ActiveRecord::Migration[5.0]
  def change
    add_column :route_points, :performer_id, :integer
  end
end
