class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.datetime :date_debut
      t.datetime :date_fin
      t.references :company
			t.references :contract_type
			t.references :student  

      t.timestamps
    end
  end
end
