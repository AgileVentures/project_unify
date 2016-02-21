class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token
  clear_respond_to
  respond_to :json


  def new
    bidning.pry
    super
  end

  def create
    binding.pry
  end

  def after_sign_up_path_for(resource)
    binding.pry
    #new_user_session_path
  end

end