class AddAddressLongitudeToSpace < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :address_longitude, :float
  end
end
