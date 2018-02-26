json.extract! tariff, :id, :country, :zip, :weight, :price, :carrier, :expire, :transit_time, :loading_region, :created_at, :updated_at
json.url tariff_url(tariff, format: :json)
