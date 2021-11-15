class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      # validation_error(resource)
      render json: resource.errors, status: 400
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def errors_not_authorized
    render json: {
      errors:
        [
          {
            message: 'Oops! You are not authorized!',
            title: 'Not_authorised_user',
            status: 401
          }
        ]
    }, status: 401
  end

  def not_found
    render json: {
      errors: [
        {
          status: '404',
          title: 'Not Found!'
        }
      ]
    }, status: 404
  end

  def record_invalid
    render json: {
      errors: [
        {
          message: 'Oops! something went wrong!',
          status: '400',
          title: 'Invalid Record'
        }
      ]
    }, status: 400
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
