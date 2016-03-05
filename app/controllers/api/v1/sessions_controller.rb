class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token

  include SessionsDoc
  clear_respond_to
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?
    @resource = resource
    render '/api/v1/users/success'
  end

  def destroy
    user = User.find_by_authentication_token(request.headers['X-API-TOKEN'])
    if user
      user.authentication_token = nil
      render json: { message: 'Session deleted.' }, status: 204
    else
      render json: { message: 'Invalid token.' }, status: 404
    end
  end
end