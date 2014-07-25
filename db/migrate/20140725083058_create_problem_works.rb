class CreateProblemWorks < ActiveRecord::Migration
  def change
    create_table :problem_works do |t|
      t.belongs_to  :problem, index: true
      t.belongs_to  :create_user, index: true
      t.belongs_to  :change_status, index: true
      t.text        :description
      t.datetime    :create_at
    end
  end
end
