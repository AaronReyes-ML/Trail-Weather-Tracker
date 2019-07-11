json.array!(@trails) do |trail|
  json.extract! trail, :id, :name, :nature, :difficulty, :latitude, :longitude
  json.url trail_url(trail, format: :json)
end
