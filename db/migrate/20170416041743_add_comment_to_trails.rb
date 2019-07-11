class AddCommentToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :comment, :string
  end
end
