class Comments::Update

  attr_accessor :params, :comment, :user

  def initialize(comment, params, user)
    @comment = comment
    @params = params
    @user = user
  end

  def execute
    comment.update!(mount_params)
    comment
  end

  def find_comment!
    Comment.find(params[:comment_id])
  end

  private

  def mount_params
    {
      comment: params[:comment]
    }
  end

end
