class Api::V1::CharactersController < BaseController
  before_action :set_character, only: %i[show create update delete]
  acts_as_token_authentication_handler_for User, except: %i[ index show ]

  def index
    if params[:query].present?
      @characters = Character.where("name @@ ?", "%#{params[:query]}%")
    elsif 
      @charcacter.filter
    else
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


  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :age, :weight, :history, :photo)
  end
end

