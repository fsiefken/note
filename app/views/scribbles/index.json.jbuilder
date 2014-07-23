json.array!(@scribbles) do |scribble|
  json.extract! scribble, :id, :user_email, :title, :tags, :content, :created, :published
  json.url scribble_url(scribble, format: :json)
end
