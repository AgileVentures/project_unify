json.users(@users) do |user|
  json.id user.id
  json.user_name user.user_name
  json.created_at user.created_at
  json.profile api_v1_user_url(user)
end