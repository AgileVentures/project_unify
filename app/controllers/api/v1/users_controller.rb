class Api::V1::UsersController < ApiController

include Api::V1::UsersDoc

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:user][:id])
  end

  def unify
    @user = User.find(params[:id])
    @unified_users = @user.unify
  end
end

