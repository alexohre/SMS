json.extract! admin_event, :id, :name, :description, :start_date, :start_time, :duration, :created_at, :updated_at
json.url admin_event_url(admin_event, format: :json)
