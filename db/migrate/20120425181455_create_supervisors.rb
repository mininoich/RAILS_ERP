class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|

      t.timestamps
    end
  end
end
