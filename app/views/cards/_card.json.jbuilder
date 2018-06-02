json.extract! card, :id, :card_number, :month, :year, :cvc, :status, :brand, :type, :scheme, :bank_name, :bank_city, :country_name, :created_at, :updated_at
json.url card_url(card, format: :json)
