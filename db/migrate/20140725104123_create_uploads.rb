class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :avatar
      t.references :attachable, polymorphic: true
    end
  end
end
