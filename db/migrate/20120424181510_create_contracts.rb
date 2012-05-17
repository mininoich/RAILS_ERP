class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.date :date_debut
      t.date :date_fin 
      
      t.belongs_to :student
      t.belongs_to :company   
      t.belongs_to :contract_type   

      t.timestamps
    end
      
      add_index :contracts, :student_id   
      add_index :contracts, :company_id   
      add_index :contracts, :contract_type_id 
  end
end
