class Users::SessionsController < Devise::SessionsController
  respond_to :json
  private

  def respond_with(resource, _apt = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end

  # def log_out_success
  #   render json: {
  #     message: 'Sayonara! You are logged out. See you soon!',
  #     title: 'Logout_success'
  #   }, status: 200
  # end
end