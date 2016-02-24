class UserService
  include Godmin::Resources::ResourceService

  attrs_for_index :user_name, :created_at
  attrs_for_show :user_name, :email, :created_at
  attrs_for_form :user_name, :email, :password, :password_confirmation

  filter :user_name
  batch_action :destroy, confirm: true

  def filter_user_name(resources, value)
    resources.where('user_name LIKE ?', "%#{value}%")
  end

  def update_resource(resource, params)
    if params[:password].blank? then
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    resource.update(params)
  end
end
