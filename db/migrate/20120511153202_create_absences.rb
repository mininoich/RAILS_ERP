class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |a|
	  a.string :justificative
	  a.belongs_to :student
      a.timestamps
    end
    
    add_index :absences, :student_id
  end
end
