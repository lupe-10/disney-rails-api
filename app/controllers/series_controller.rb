class seriesController < BaseController
  before_action :set_character, only: %i[show create update delete]

  def index
    @series = Serie.all
  end

  def show 
  end

  def create
    @serie = Serie.new(serie_params)
    if @serie.save
      render :show
    else
      render_error
    end
  end

  def update
    @serie = Serie.update(serie_params)
    if @serie.save
      render :show
    else
      render_error
    end
  end

  def destroy
    if @serie.destroy
      head(:ok)
    else
      render_error
    end
  end

  private

  def render_error
    render json: { errors: @serie.errors.full_messages },
                   status: :unprocessable_entity
  end

  def set_character
    @serie = Serie.find(params[:id])
  end

  def serie_params
    params.require(:serie).permit(:title, :rating, :gender)
  end
end
