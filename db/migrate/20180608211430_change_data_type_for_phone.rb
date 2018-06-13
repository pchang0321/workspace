class ChangeDataTypeForPhone < ActiveRecord::Migration[5.0]
  def change
    change_column :spaces, :phone_number, :string
  end
end
