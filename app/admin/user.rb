ActiveAdmin.register User, as: 'Student' do
  controller do
    def scoped_collection
      User.where(status: 'active', position_id: 1)

    end
  end
  
  index do
    selectable_column
    column :name do |user|
      link_to user.name, admin_admin_user_path(user)
    end
    column :email
    column :phone
    column :skype
    column 'Reject' do |user|
      link_to 'Reject', reject_path(user)
    end
    actions
  end

end

ActiveAdmin.register User, as: 'Teacher' do
  controller do
    def scoped_collection
      User.where(status: 'active', position_id: 2)
    end
  end
  
  index do
    selectable_column
    column :name do |user|
      link_to user.name, admin_admin_user_path(user)
    end
    column :email
    column :phone
    column :skype
    column 'Reject' do |user|
      link_to 'Reject', reject_path(user)
    end
    actions
  end

end

ActiveAdmin.register User, as: 'Notactive' do
  controller do
    def scoped_collection
      User.where(status: 'notactive')
    end
  end

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

ActiveAdmin.register User, as: 'Rejected' do
  controller do
    def scoped_collection
      User.where(status: 'denied')
    end
  end

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
    actions
  end

end

