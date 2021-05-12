class seriesController < BaseController
  before_action :set_character, only: %i[show create update delete]
  acts_as_token_authentication_handler_for User, except: %i[ index show ]
  
  def index
    if params[:query].present?
      @series = Serie.where("title @@ ?", "%#{params[:query]}%")
    elsif 
      filter(filtering_params)
    else
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


  def set_character
    @serie = Serie.find(params[:id])
  end

  def serie_params
    params.require(:serie).permit(:title, :rating, :gender)
  end
end
