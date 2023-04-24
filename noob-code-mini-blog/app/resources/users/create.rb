class Users::Create

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    User.create!(mount_params)
  end

  private

  def mount_params
    {
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      kind: 'JO'
    }
  end

end
