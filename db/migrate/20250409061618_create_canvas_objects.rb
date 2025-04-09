class CreateCanvasObjects < ActiveRecord::Migration[8.0]
  def change
    create_table :canvas_objects do |t|
      t.references :board, null: false, foreign_key: true
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
