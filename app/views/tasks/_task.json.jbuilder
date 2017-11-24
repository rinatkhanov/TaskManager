json.extract! task, :id, :text, :scheduled_at, :done, :created_at, :updated_at
json.url task_url(task, format: :json)
