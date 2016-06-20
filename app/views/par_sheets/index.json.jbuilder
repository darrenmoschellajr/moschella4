json.array!(@par_sheets) do |par_sheet|
  json.extract! par_sheet, :id, :day, :truck_id
  json.url par_sheet_url(par_sheet, format: :json)
end
