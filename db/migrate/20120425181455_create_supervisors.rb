class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.belongs_to :user
      t.timestamps
    end
    
    add_index :supervisors, :user_id
  end
end
