json.array!(@par_levels) do |par_level|
  json.extract! par_level, :id, :truck, :product, :day, :parlevel
  json.url par_level_url(par_level, format: :json)
end
