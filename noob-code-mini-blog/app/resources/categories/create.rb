class Categories::Create

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    Category.find_or_create_by!(mount_params)
  end

  private

  def mount_params
    { name: params[:name] }
  end

end
