class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.belongs_to :user
      t.timestamps
    end
    
    add_index :admins, :user_id
  end
end