class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :weight
      t.integer :age
      t.string :history
      t.timestamps
    end
  end
end
