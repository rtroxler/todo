json.extract! task, :id, :description, :project_id, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
