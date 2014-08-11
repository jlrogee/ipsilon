class AddQualificationToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :qualification, :integer
  end
end
