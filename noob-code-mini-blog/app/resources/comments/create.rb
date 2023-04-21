class Comments::Create

  attr_accessor :params, :post, :user

  def initialize(params)
    @params = params

    @post = find_post!

    @user = current_user
  end

  def execute
    Comment.create!(mount_params)
  end

  private

  def find_post!
    Post.find(params[:post_id])
  end

  def mount_params
    {

      comment: params[:comment],

      post: post,

      user: user

    }
  end

end
