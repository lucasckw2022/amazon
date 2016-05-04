class AddCommentReferenceToProducts < ActiveRecord::Migration
  def change
add_column :comments, :star, :float
  end
end
