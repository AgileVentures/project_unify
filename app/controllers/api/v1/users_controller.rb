class Api::V1::UsersController < ApiController

  def index
    @users = User.all
  end
end