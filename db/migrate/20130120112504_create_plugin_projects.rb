class CreatePluginProjects < ActiveRecord::Migration
  def change
    create_table :plugin_projects do |t|
      t.references :plugin
      t.references :project

      t.timestamps
    end
    add_index :plugin_projects, :plugin_id
    add_index :plugin_projects, :project_id
  end
end
