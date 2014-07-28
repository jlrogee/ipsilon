class CreateDepartaments < ActiveRecord::Migration
  def change
    create_table :departaments do |t|
      t.string :depname
      t.belongs_to :organization, index: true
      t.string :adress
      t.string :phone
      t.string :city
      t.integer :zipcode
      t.string :country

      t.timestamps
    end
  end
end
