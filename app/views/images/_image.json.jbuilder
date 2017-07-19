json.extract! image, :id, :name, :picture, :mood_id, :created_at, :updated_at
json.url image_url(image, format: :json)
