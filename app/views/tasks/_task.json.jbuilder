json.extract! task, :id, :title, :description, :scheduled_date, :due_date, :has_time, :start_time, :end_time, :duration_minutes, :priority, :status, :completed_at, :is_recurring, :created_at, :updated_at
json.url task_url(task, format: :json)
