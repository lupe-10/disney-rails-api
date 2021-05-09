class CreateCharacterInSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :character_in_series do |t|

      t.timestamps
    end
  end
end
