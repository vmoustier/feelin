json.extract! user_mood, :id, :user_id, :mood_id, :created_at, :updated_at
json.url user_mood_url(user_mood, format: :json)
