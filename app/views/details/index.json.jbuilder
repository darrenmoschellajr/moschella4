json.array!(@details) do |detail|
  json.extract! detail, :id, :bhproduct_number, :inventorysession_id, :quantity
  json.url detail_url(detail, format: :json)
end
