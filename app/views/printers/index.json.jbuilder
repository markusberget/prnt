json.array!(@printers) do |printer|
  json.extract! printer, :id, :name, :location, :rating, :configuration_id
  json.url printer_url(printer, format: :json)
end
