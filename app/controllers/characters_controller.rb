class Api::V1::CharactersController < BaseController
  before_action :set_character, only: %i[show create update delete]

  def index
    @characters = Character.all
  end

  def show 
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      render :show
    else
      render_error
    end
  end

  def update
    @character = Character.update(character_params)
    if @character.save
      render :show
    else
      render_error
    end
  end

  def destroy
    if @character.destroy
      head(:ok)
    else
      render_error
    end
  end

  private

  def render_error
    render json: { errors: @character.errors.full_messages },
                   status: :unprocessable_entity
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :age, :weight, :history, :character_in_movie_id, :character_in_serie_id)
  end
end

