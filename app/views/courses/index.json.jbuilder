json.array!(@courses) do |course|
  json.extract! course, :id, :name, :largeIcon, :photo, :shortDescription, :video, :longDescription
  json.url course_url(course, format: :json)
end
