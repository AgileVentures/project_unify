class UserService
  include Godmin::Resources::ResourceService

  attrs_for_index :user_name, :created_at
  attrs_for_show :user_name, :created_at
  attrs_for_form :user_name, :created_at
end
