class Api::V1::RegistrationsController < ApiController


  respond_to :json

  def create
    binding.pry
    user = User.new(user_params)

    if user.save
      #render :json => user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
      render 'users#show'

      return
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end

  def user_params
    params.permit(:user_name, :email, :password, :password_confirmation)
  end

end