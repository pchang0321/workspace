class AddAddressLatitudeToSpace < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :address_latitude, :float
  end
end
