json.array!(@scribbles) do |scribble|
  json.extract! scribble, :id, :title, :tags, :content, :created, :published
  json.url scribble_url(scribble, format: :json)
end
