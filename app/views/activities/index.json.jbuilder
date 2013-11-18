json.array!(@activities) do |activity|
  json.extract! activity, :name, :location, :blurb, :url, :type
  json.url activity_url(activity, format: :json)
end
