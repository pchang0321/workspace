class RenameCommentToComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :comment, :comments
  end
end
