class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
	  t.string :name
	  t.integer :nb_places
	  t.integer :nb_computers
      t.timestamps
    end
  end
end