class Api::V1::RegistrationsController < Devise::RegistrationsController

  # Register user
  #
  # curl -H "Content-Type: application/json" -X POST -d '{"user":{"user_name":"xyz","password":"password", "password_confirmation":"password", "email":"thomas@makersacademy.se"}}' http://localhost:3000/api/v1/users


  skip_before_filter :verify_authenticity_token
  clear_respond_to
  respond_to :json


  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        expire_data_after_sign_in!
        respond_with resource #, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def after_sign_up_path_for(resource)
    user_session_path
  end

  def after_update_path_for(resource)
    binding.pry
  end

end