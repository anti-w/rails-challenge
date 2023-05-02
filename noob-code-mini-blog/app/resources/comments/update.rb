class Comments::Update

    attr_accessor :params, :comment, :post
  
    def initialize(comment, params)
      @comment = comment
      @params = params
      @post = find_post!
    end
  
    def execute
      comment.update!(mount_params)
      comment
    end

    def find_post!
        Post.find(params[:post_id])
    end
  
    private
  
    def mount_params
      {
        comment: params[:comment],
        post: post
      }
    end
  
end
  