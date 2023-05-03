class Categories::Update

  attr_accessor :params, :category

  def initialize(category, params)
    @category = category
    @params = params
  end

  def execute
    category.update!(mount_params)
    category
  end

  private

  def mount_params
    {
      name: params[:name] || post.name
    }
  end

end
