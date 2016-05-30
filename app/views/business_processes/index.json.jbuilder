json.array!(@business_processes) do |business_process|
  json.extract! business_process, :id, :description, :author_id, :route_id, :executed, :execution_date, :file_id
  json.url business_process_url(business_process, format: :json)
end
