ActiveAdmin.register Project do
  menu :if => proc{ can?(:read, Project) }
  controller.authorize_resource

  show do |ad|
    attributes_table do
      row :name
      row :description
    end
  end

  index do
    column :name
    column :description
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Project Details" do
      f.input :name
      f.input :description
    end
    f.actions
  end

end
