class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ad_street
      t.string :ad_city

      t.timestamps
    end
  end
end
