json.extract! provider, :id, :name, :cnpj, :address, :phone, :created_at, :updated_at
json.url provider_url(provider, format: :json)
