json.extract! event, :id, :tap_id, :kind, :created_at, :updated_at
json.url event_url(event, format: :json)
