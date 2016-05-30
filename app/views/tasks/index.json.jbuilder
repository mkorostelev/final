json.array!(@tasks) do |task|
  json.extract! task, :id, :business_process_id, :executed, :route_id, :route_point_id, :performer_id, :executor_id, :execution_date, :comment
  json.url task_url(task, format: :json)
end
