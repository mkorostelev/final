json.array!(@route_points) do |route_point|
  json.extract! route_point, :id, :number, :description
  json.url route_point_url(route_point, format: :json)
end
