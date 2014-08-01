class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :catname
      t.string  :description

      t.timestamps
    end
  end
end
