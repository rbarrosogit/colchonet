class Room < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |room|
      room.string :title, null: false
      room.string :location, null: false
      room.text :description

      room.timestamps 
    end
  end
end