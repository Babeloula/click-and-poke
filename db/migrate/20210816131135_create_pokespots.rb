class CreatePokespots < ActiveRecord::Migration[6.0]
  def change
    create_table :pokespots do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :price
      t.string :pokemon_type
      t.integer :scarcity_drop_level
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
