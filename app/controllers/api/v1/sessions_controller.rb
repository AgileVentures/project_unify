class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token

  # Sign in user
  #
  # curl -H "Content-Type: application/json" -X POST -d '{"user":{"user_name":"xyz","password":"password", "email":"thomas@makersacademy.se"}}' http://localhost:3000/api/v1/users/sign_in

  clear_respond_to
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource #, location: after_sign_in_path_for(resource)
  end

end