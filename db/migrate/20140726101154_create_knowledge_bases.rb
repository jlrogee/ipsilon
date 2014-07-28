class CreateKnowledgeBases < ActiveRecord::Migration
  def change
    create_table :knowledge_bases do |t|
      t.integer     :type
      t.string      :kbname, :unique => true
      t.text        :description
      t.text        :instruction
      t.belongs_to  :create_user, index: true
      t.belongs_to  :update_user, index: true
      t.timestamps
    end
  end
end
