json.extract! user, :name, :avatar_file_name,:description,:intro,:phname,:college_id,:created_at, :updated_at
json.url user_url(user, format: :json)