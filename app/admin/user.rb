ActiveAdmin.register User, as: "Student" do

  permit_params :name, :skype, :phone, :status, :email, :position_id, :password, :password_confirmation

  controller do
    def scoped_collection
      User.where(status: 'active', position_id: 1)
    end
  end

  form do |f|
    f.inputs "Student" do
      f.input :position
      f.input :name
      f.input :skype
      f.input :phone
      f.input :email
      f.input :teacher, collection: User.where(position_id: 2)
      f.input :status
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
  index do
    selectable_column
    column :name
    column :email
    column :phone
    column :skype
    column :teacher
    column 'Отказ' do |user|
      link_to 'Отказать', reject_path(user)
    end

    actions
  end

end

ActiveAdmin.register User, as: 'Teacher' do
  
  permit_params :name, :skype, :phone, :status, :email, :position_id, :password, :password_confirmation

  controller do
    def scoped_collection
      User.where(status: 'active', position_id: 2)
    end
  end

    form do |f|
    f.inputs "Teacher" do
      f.input :position
      f.input :name
      f.input :skype
      f.input :phone
      f.input :email
      f.input :status
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
  index do
    selectable_column
    column :name
    column :email
    column :phone
    column :skype
    column 'Отказ' do |user|
      link_to 'Отказать', reject_path(user)
    end
    actions
  end

end
ActiveAdmin.register User, as: 'Notactive' do

  permit_params :name, :skype, :phone, :status, :email, :position_id, :password, :password_confirmation
  

  controller do
    def scoped_collection
      User.where(status: 'notactive').where.not(confirmed_at: nil)
    end
  end

  form do |f|
    f.inputs "Notactive" do
      f.input :position
      f.input :name
      f.input :skype
      f.input :phone
      f.input :email
      f.input :status
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  index do
    selectable_column
    column :name do |user|
      user.name
    end
    column :position
    column :email
    column :phone
    column :skype
    column 'Подтверждение' do |user|
      link_to 'Подтвердить', accept_path(user)
    end
    column 'Отказ' do |user|
      link_to 'Отказать', reject_path(user)
    end
    actions
  end

end

ActiveAdmin.register User, as: 'Rejected' do

  permit_params :name, :skype, :phone, :password_confirmation, :password, :status, :email

  controller do
    def scoped_collection
      User.where(status: 'denied')
    end
  end

  form do |f|
      f.inputs "Rejected" do
        f.input :position
        f.input :name
        f.input :skype
        f.input :phone
        f.input :email
        f.input :status
        f.input :password
        f.input :password_confirmation
      end
      f.actions
  end


  index do
    selectable_column
    column :name do |user|
        user.name
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
