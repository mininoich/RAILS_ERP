class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.date :date_debut
      t.date :date_fin      

      t.timestamps
    end
 			add_column :students, :student_id, :integer
 			add_column :companies, :company_id, :integer
 			add_column :contract_types, :contract_type_id, :integer
  end
end
