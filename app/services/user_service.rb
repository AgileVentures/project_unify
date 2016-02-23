class UserService
  include Godmin::Resources::ResourceService

  attrs_for_index :user_name, :skill_list
  attrs_for_show :user_name, :skill_list, :created_at
  attrs_for_form :user_name, :skill_list
  filter :user_name
  filter :skill_list
  batch_action :destroy, confirm: true

  def filter_user_name(resources, value)
    resources.where('user_name LIKE ?', "%#{value}%")
  end

  def filter_skill_list(resources, value)
    resources.tagged_with(value)
  end

  def update_resource(resource, params)
    resource.skill_list.try(:each) {|skill| resource.skill_list.remove(skill)}
    resource.user_name = params[:user_name]
    resource.skill_list.add(params[:skill_list], parse: true)
    resource.save
  end

end
