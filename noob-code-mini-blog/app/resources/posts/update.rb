class Posts::Update

  attr_accessor :params, :post

  def initialize(post, params)
    @post = post
    @params = params
  end

  def execute
    post.update!(mount_params)
    post
  end

  private

  def mount_params
    {
      title: params[:title] || post.title,

      description: params[:description] || post.description,

      category_id: params[:category_id] || post.category_id
    }
  end

end
