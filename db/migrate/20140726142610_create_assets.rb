class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string        :name
      t.integer       :type
      t.belongs_to    :organization
      t.string        :account_number
      t.belongs_to    :user

      t.timestamps
    end
  end
end
