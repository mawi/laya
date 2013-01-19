class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :api_key
      t.references :user
      t.references :project

      t.timestamps
    end
    add_index :clients, :user_id
    add_index :clients, :project_id
  end
end
