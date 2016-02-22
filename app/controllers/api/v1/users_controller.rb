class Api::V1::UsersController < ApiController


  api :GET, '/v1/users/','List of resources: User'
  formats ['json']
  description  'Returns a list of registered users with URL\'s to #show for each instance'
  example " 'user': {...} "
  def index
    @users = User.all
  end

  api :GET, '/v1/users/:id', 'Show a :resource'
  formats ['json']
  description  'Returns an instance of user'
  example " 'user': {...} "

  def show
    @user = User.find(params[:user][:id])
  end
end