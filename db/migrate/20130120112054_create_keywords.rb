class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.string :trigger
      t.references :plugin

      t.timestamps
    end
    add_index :keywords, :plugin_id
  end
end
