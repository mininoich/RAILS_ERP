class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ad_rue
      t.string :ad_ville

      t.timestamps
    end
  end
end
