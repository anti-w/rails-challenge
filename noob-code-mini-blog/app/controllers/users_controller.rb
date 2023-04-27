class UsersController < ApplicationController

  def index
    users = Users::List.new(params).execute

    render json: users, meta: pagination(users), each_serializer: UserSerializer, status: :ok
  end

end
