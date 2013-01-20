class CreateProjectSettings < ActiveRecord::Migration
  def change
    create_table :project_settings do |t|
      t.string :name
      t.string :value
      t.references :project
      t.references :plugin

      t.timestamps
    end
    add_index :project_settings, :project_id
    add_index :project_settings, :plugin_id
  end
end
