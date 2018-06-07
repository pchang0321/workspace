class AddReviewCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reviews_count, :integer
  end
end
