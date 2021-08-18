class AddCoordinatesToPokespots < ActiveRecord::Migration[6.0]
  def change
    add_column :pokespots, :latitude, :float
    add_column :pokespots, :longitude, :float
  end
end
