class PostsController < ApplicationController

  before_action :set_post, only: %i[show update destroy]

  def index
    posts = Posts::List.new(params).execute

    render json: posts, meta: pagination(posts), each_serializer: PostSerializer, status: :ok
  end

  def show
    render json: @post, serializer: PostSerializer, list_comments: true, status: :ok
  end

  def create
    @post = Posts::Create.new(post_params, current_user).execute

    render json: @post, serializer: PostSerializer, status: :created
  end

  def update
    updated_post = Posts::Update.new(@post, post_params).execute

    render json: updated_post, serializer: PostSerializer, status: :ok
  end

  def destroy
    Posts::Destroy.new(@post).execute

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  # Only allow a list of trusted parameters through.

  def post_params
    params.require(:post).permit(:title, :description, :category_id, :user_id)
  end

end
