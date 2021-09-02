class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.text :name
      t.text :title
      t.text :img

      t.timestamps
    end
  end
end
