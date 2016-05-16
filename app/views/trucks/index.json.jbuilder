json.array!(@trucks) do |truck|
  json.extract! truck, :id, :name, :trucknumber
  json.url truck_url(truck, format: :json)
end
