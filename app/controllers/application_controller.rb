class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
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
      'errors': [
        {
          'status': '404',
          'title': 'Not Found!'
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
end
