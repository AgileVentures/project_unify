class UserService
  include Godmin::Resources::ResourceService

  attrs_for_index :user_name, :created_at
  attrs_for_show :user_name, :created_at
  attrs_for_form :user_name

  filter :user_name
  batch_action :destroy, confirm: true

  def filter_user_name(resources, value)
    resources.where('user_name LIKE ?', "%#{value}%")
  end
end
