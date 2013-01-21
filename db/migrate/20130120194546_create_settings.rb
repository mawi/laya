class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.references :plugin

      t.timestamps
    end
    add_index :settings, :plugin_id
  end
end
