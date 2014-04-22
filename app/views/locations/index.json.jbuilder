json.array!(@locations) do |location|
  json.extract! location, :id, :state, :population_density
  json.url location_url(location, format: :json)
end
