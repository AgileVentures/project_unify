class Api::V1::UsersController < ApiController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user][:id])
  end
end