class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.datetime :date_debut
      t.datetime :date_fin 

      t.timestamps
    end
  end
end
