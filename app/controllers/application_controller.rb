class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    unless Rails.env.development?
    rescue_from Exception, with: :exception_handler
    end
  
    private 

    def exception_handler(exception)
      case exception
      when not_found(exception)
      render json: { message: 'Something goes wrong' }, status: :unprocessable_entity
      when ActionController::UnknownFormat, ActionController::InvalidCrossOriginRequest
        render json: { message: 'Bad request' }, status: :unprocessable_entity
      when ActiveRecord::RecordNotFound, ActionController::UnknownController, ActionController::RoutingError 
        render json: { message: 'Not found' }, status: :not_found
      else
        # perform an error
        # logs goes here
        render json: { message: 'Internal error' }, status: :internal_server_error
      end
    end
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_error
    render json: { errors: object.errors.full_messages },
                   status: :unprocessable_entity
  end
end
