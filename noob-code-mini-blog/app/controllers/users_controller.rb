class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = Users::List.new(params).execute

    render json: users, meta: pagination(users), each_serializer: UserSerializer, status: :ok
  end

end
