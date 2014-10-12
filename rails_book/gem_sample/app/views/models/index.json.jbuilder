json.array!(@models) do |model|
  json.extract! model, :id, :tweet, :body, :user_id
  json.url model_url(model, format: :json)
end
