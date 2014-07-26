class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.belongs_to  :problem, index: true
      t.belongs_to  :create_user, index: true
      t.belongs_to  :state, index: true
      t.text        :description
      t.timestamps
    end
  end
end
