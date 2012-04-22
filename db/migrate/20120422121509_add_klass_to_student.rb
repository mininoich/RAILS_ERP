class AddKlassToStudent < ActiveRecord::Migration
  def change
    add_column :students, :klass_id, :integer
    add_index :students, :klass_id
  end
end