json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :project_id, :task_id
  json.url assignment_url(assignment, format: :json)
end
