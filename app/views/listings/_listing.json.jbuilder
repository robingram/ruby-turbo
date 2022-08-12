json.extract! listing, :id, :title, :address, :available_from, :created_at, :updated_at
json.url listing_url(listing, format: :json)
