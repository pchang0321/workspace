class AddAddressFormattedAddressToSpace < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :address_formatted_address, :string
  end
end
