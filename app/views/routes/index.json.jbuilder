json.array!(@routes) do |route|
  json.extract! route, :id, :title, :description, :author
  json.url route_url(route, format: :json)
end
