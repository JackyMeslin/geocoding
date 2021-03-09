class AddCoordinatesToMegaliths < ActiveRecord::Migration[6.0]
  def change
    add_column :megaliths, :latitude, :float
    add_column :megaliths, :longitude, :float
  end
end
