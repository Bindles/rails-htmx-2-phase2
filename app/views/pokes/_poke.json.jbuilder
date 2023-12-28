json.extract! poke, :id, :name, :url, :category, :created_at, :updated_at
json.url poke_url(poke, format: :json)
