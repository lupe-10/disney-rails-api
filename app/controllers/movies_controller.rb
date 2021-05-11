class MoviesController < BaseController
  before_action :set_character, only: %i[show create update delete]
  acts_as_token_authentication_handler_for User, except: %i[ index show ]

  def index
    if params[:query].present?
      @movies = Movie.where("title @@ ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
  end

  def sorted_movies
    @movies_desc = Movie.order('created_at DESC').all
    @movies_asc = Movie.order('created_at ASC').all
  end

  def show 
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render :show
    else
      render_error
    end
  end

  def update
    @movie = Movie.update(movie_params)
    if @movie.save
      render :show
    else
      render_error
    end
  end

  def destroy
    if @movie.destroy
      head(:ok)
    else
      render_error
    end
  end

  private

  def render_error
    render json: { errors: @movie.errors.full_messages },
                   status: :unprocessable_entity
  end

  def set_character
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :gender)
  end
end
