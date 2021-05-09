class CreateCharacterInMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :character_in_movies do |t|

      t.timestamps
    end
  end
end
