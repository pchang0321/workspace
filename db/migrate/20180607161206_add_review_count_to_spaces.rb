class AddReviewCountToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :reviews_count, :integer
  end
end
