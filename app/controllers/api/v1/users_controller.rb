class Api::V1::UsersController < ApiController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end