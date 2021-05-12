class Api::V1::BaseController < ActionController::API
 
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_error
    render json: { errors: object.errors.full_messages },
                   status: :unprocessable_entity
  end

end