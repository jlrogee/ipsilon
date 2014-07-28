class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :orgname
      t.string :address
      t.string :phone
      t.string :city
      t.integer :zipcode
      t.string :country

      t.timestamps
    end
  end
end
