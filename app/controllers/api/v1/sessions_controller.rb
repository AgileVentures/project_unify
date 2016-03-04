class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token

  include SessionsDoc
  clear_respond_to
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource
  end

end