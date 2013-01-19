class AddRoleToUsers < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :is_admin, :boolean, :default => false, :null => false
    add_index  :admin_users, :is_admin
  end

  def self.down
    remove_index  :admin_users, :is_admin
    remove_column :admin_users, :is_admin
  end
end
