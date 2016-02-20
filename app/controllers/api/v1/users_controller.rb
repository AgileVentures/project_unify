class Api::V1::UsersController < ApiController
  #curl -X POST http://localhost:3000/api/v1/users --data "user: {name=John&email=user@tma.org&password=password&password_confirmation=password}"

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #render :json => user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
      render :show

      return
    else
      warden.custom_failure!
      render json: @user.errors, status: 422
    end
  end

  def user_params
    params.permit(:user_name, :email, :password, :password_confirmation)
  end
end