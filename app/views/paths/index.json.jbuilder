json.array!(@paths) do |path|
  json.extract! path, :id, :name, :description
  json.url path_url(path, format: :json)
end
