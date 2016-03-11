user = @user
json.user do
  json.id user.id
  json.user_name user.user_name
<<<<<<< HEAD
  json.lat user.latitude
  json.lng user.longitude
=======
  json.email user.email
  json.skills user.skill_list
>>>>>>> b4d98254ada92365e1f9988582b5b7fcb67126a2
  json.created_at user.created_at
end