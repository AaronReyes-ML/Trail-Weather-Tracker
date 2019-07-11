class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.string :nature
      t.string :difficulty
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
