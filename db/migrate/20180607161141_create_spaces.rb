class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :address
      t.integer :phone_number
      t.string :picture

      t.timestamps

    end
  end
end
