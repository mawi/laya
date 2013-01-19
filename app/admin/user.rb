ActiveAdmin.register User do

  menu :if => proc{ can?(:manage, User) }
  controller.authorize_resource

  show do |ad|
    attributes_table do
      row :email
      row :approved
      row :is_admin
    end
  end

  index do
    column :email
    column :approved
    column :is_admin
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :approved
      f.input :is_admin
    end
    f.actions
  end

end
