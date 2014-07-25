class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.belongs_to  :create_user, index: true
      t.belongs_to  :performer_user, index: true
      t.belongs_to  :last_update_user, index: true
      t.belongs_to  :priority
      t.belongs_to  :status
      t.belongs_to  :category
      t.belongs_to  :asset
      t.text        :description
      t.datetime    :time_to_close
      t.datetime    :fact_close

      t.timestamps
    end
  end
end
