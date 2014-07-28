class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :prname
      t.integer :days_to_close

      t.timestamps
    end
  end
end
