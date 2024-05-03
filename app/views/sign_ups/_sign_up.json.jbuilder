json.extract! sign_up, :id, :first_name, :last_name, :paided, :created_at, :updated_at
json.url sign_up_url(sign_up, format: :json)
