json.extract! troop_event, :id, :start_date, :end_date, :start_time, :end_time, :title, :location, :cost, :description, :created_at, :updated_at
json.url troop_event_url(troop_event, format: :json)
