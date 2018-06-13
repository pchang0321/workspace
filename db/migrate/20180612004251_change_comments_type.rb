class ChangeCommentsType < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :comment, :text
  end
end
