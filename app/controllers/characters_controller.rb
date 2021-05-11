class Api::V1::CharactersController < BaseController
  before_action :set_character, only: %i[show create update delete]
  acts_as_token_authentication_handler_for User, except: %i[ index show ]

  def index
    if params[:query].present?
      @characters = Character.where("name @@ ?", "%#{params[:query]}%")
    else
    @characters = Character.all
  end

  def filter_by
    def index
      @filter_result = Character.filter(params.slice(:name, :age, :weight,))
      @character_in_movie = Character.where('user_id = ? and chatroom_id = ?', current_user.id, @event.chatroom.id)
    end
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
    params.require(:character).permit(:name, :age, :weight, :history)
  end
end

