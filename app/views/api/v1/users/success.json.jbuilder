user = @resource
json.message 'success'
json.user do
  json.id user.id
  json.user_name user.user_name
  json.email user.email
  json.mentor user.mentor
  json.token user.authentication_token
end
