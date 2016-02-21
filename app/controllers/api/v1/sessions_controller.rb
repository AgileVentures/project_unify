class Api::V1::SessionsController < Devise::SessionsController
  before_action :default_response_format

  clear_respond_to
  respond_to :json

  binding.pry

  protected

  def default_response_format
    request.format = :json
  end

end