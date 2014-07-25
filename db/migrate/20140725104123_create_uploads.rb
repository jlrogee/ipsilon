class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.references :attachable, polymorphic: true

      t.timestamps
    end
  end
end
