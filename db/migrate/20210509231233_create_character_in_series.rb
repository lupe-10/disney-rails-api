class CreateCharacterInSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :character_in_series do |t|
      t.references :character
      t.references :serie
      t.timestamps
    end
  end
end
