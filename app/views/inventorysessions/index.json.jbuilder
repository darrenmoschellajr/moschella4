json.array!(@inventorysession) do |session|
  json.extract! inventorysession, :id, :sessiondate, :truck_id
  json.url inventorysession_url(inventorysession, format: :json)
end
