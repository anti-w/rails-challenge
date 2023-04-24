class ApplicationController < ActionController::Base

  before_action :configure_permited_parameters, if: :devise_controller?

  include DeviseTokenAuth::Concerns::SetUserByToken

  include ErrorsHandler::Handler

  include ActionController::MimeResponds

  include ActionController::Serialization



  protect_from_forgery with: :null_session



  def pagination(object)
    {

      current_page: object.current_page,

      per_page: object.per_page(params),

      total_pages: object.total_pages,

      total_count: object.total_count

    }
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kind, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:kind, :name])
  end

end
