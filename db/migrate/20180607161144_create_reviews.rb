class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :space_id
      t.integer :ambience
      t.integer :roominess
      t.integer :fooddrink
      t.integer :outlets
      t.integer :wifi

      t.timestamps

    end
  end
end
