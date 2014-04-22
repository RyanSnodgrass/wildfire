json.array!(@fires) do |fire|
  json.extract! fire, :id, :started_by, :acres, :still_burning, :location_id
  json.url fire_url(fire, format: :json)
end
