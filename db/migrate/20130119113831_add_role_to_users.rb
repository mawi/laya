class AddRoleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_admin, :boolean, :default => false, :null => false
    add_index  :users, :is_admin
  end

  def self.down
    remove_index  :users, :is_admin
    remove_column :users, :is_admin
  end
end
