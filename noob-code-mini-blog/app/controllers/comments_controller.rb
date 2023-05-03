class CommentsController < ApplicationController

  before_action :set_comment, only: %i[update destroy]

  def index
    comments = Comments::List.new(params).execute

    render json: comments, meta: pagination(comments), each_serializer: CommentSerializer, list_user_infos: true, status: :ok
  end

  def create
    @comment = Comments::Create.new(comment_params, current_user).execute

    render json: @comment, serializer: CommentSerializer, status: :created
  end

  def update
    updated_comment = Comments::Update.new(@comment, comment_params, current_user).execute

    render json: updated_comment, serializer: CommentSerializer, status: :created
  end

  def destroy
    Comments::Destroy.new(@comment).execute

    head :no_content
  end

  private

  # Only allow a list of trusted parameters through.

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

end
