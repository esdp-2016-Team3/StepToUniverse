ActiveAdmin.register User, as: "Student" do

  permit_params :name, :skype, :phone, :status, :email, :teacher_id, :position_id, :password, :password_confirmation

  controller do
    def scoped_collection
      User.where(status: 'active', position_id: 1)
    end
  end

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end

  form do |f|
    f.inputs "Student" do
      f.input :position
      f.input :name
      f.input :skype
      f.input :phone
      f.input :email
      f.input :teacher_id, as: :select, collection: User.where(position_id: 2, status: 'active')
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
    column :teacher do |t|
      if t.teacher != nil
       t.teacher.name.to_s
      end
    end
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

  show do        
        attributes_table do
          row :name
          row :phone
          row :skype
          row :email
          row :description
        end
    panel "Анкетирование" do
      table_for notactive.profile_answers do
        column :question
        column :answer
      end
    end
    active_admin_comments
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

  show do        
        attributes_table do
          row :name
          row :phone
          row :skype
          row :email
          row :description
        end
    panel "Анкетирование" do
      table_for notactive.profile_answers do
        column :question
        column :answer
      end
    end
    active_admin_comments
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
