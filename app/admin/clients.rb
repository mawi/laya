ActiveAdmin.register Client do
  menu :if => proc{ can?(:read, Client) }
  controller.authorize_resource
  scope_to :current_user

  show do |ad|
    attributes_table do
      row :name
      row :api_key
      row :project
    end
  end

  index do
    column :name
    column :api_key
    column :project
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Client Details" do
      f.input :name
      f.input :project
      f.input :user_id, :as => :hidden, :value => current_user.id
    end
    f.actions
  end


  # controller do
  #   def create
  #     @client = Client.create(params[:client])
  #     @client.user_id
  #     binding.pry
  #   end
  # end

end
