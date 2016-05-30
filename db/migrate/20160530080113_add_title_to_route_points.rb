class AddTitleToRoutePoints < ActiveRecord::Migration[5.0]
  def change
    add_column :route_points, :title, :string
  end
end
