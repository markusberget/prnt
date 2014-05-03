json.array!(@configurations) do |configuration|
  json.extract! configuration, :id, :price, :color, :size, :double_sided, :description
  json.url configuration_url(configuration, format: :json)
end
