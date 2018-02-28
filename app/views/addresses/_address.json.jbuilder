json.extract! address, :id, :line1, :line2, :city, :state, :country, :zip, :user_id, :address_type, :created_at, :updated_at
json.url address_url(address, format: :json)
