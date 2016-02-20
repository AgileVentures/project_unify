class Api::V1::UsersController < ApiController

  api :GET, '/v1/users/', 'Responds with list of users'
  def index
    @users = User.all
  end
  
  api :GET, '/v1/users/:id', 'Responds with a user resource'
  param :id, Fixnum, desc: 'user_id', required: true
  def show
    @user = User.find(params[:user][:id])
  end
end