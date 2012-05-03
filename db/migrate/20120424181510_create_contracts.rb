class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.datetime :date_debut
      t.datetime :date_fin      

      t.timestamps
    end
 			add_column :students, :student_id, :integer
 			add_column :companies, :company_id, :integer
 			add_column :contract_types, :contract_type_id, :integer
    
        add_index :contracts, :stundent_id, :type_contract_id, :company_id
  end
end
