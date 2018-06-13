class AddOverallToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :overall, :float
  end
end
