ActiveAdmin.register User, as: 'Status' do
  controller do
    def scoped_collection
      User.where(status: 'notactive')
    end
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
# 
  index do
    selectable_column
    column :name do |user|
      link_to user.name, admin_admin_user_path(user)
    end
    column :email
    column :phone
    column :skype
    column 'Accept' do |user|
      link_to 'Accept', accept_path(user)
    end
    column 'Reject' do |user|
      link_to 'Reject', reject_path(user)
    end
    actions
  end


end
