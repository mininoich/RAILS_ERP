class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.date :date_debut
      t.date :date_fin 
      
      t.integer :students_id   
      t.integer :companies_id   
      t.integer :contract_types_id   

      t.timestamps
    end
  end
end
