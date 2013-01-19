class AddApprovedToUser < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :approved, :boolean, :default => false, :null => false
    add_index  :admin_users, :approved
  end

  def self.down
    remove_index  :admin_users, :approved
    remove_column :admin_users, :approved
  end
end