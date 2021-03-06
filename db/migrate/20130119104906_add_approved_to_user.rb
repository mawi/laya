class AddApprovedToUser < ActiveRecord::Migration

  def change
    add_column :users, :approved, :boolean, :default => false, :null => false
    add_index  :users, :approved

    User.reset_column_information
    user = User.find_by_email('admin@example.com')
    user.update_attribute(:approved, true)
  end

end