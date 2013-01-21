class CreateProjectSettings < ActiveRecord::Migration
  def change
    create_table :project_settings do |t|
      t.string :value
      t.references :project
      t.references :setting
      t.references :plugin

      t.timestamps
    end
    add_index :project_settings, :project_id
    add_index :project_settings, :plugin_id
    add_index :project_settings, :setting_id
  end
end
