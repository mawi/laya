class AddRoleToUsers < ActiveRecord::Migration

  def change
    add_column :users, :is_admin, :boolean, :default => false, :null => false
    add_index  :users, :is_admin

    User.reset_column_information
    user = User.find_by_email('user@example.com')
    user.update_attribute(:is_admin, true)
  end


end
