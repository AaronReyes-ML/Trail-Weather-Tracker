class AddNoteToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :note, :string
  end
end
