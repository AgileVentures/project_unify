user = @user
json.user do
  json.id user.id
  json.user_name user.user_name
  json.email user.email
  json.skills user.skill_list
  json.created_at user.created_at
end