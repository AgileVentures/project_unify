user = @user
  json.user do
    json.id user.id
    json.user_name user.user_name
    json.created_at user.created_at
  end