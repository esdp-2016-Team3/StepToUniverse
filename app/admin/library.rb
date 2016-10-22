ActiveAdmin.register LibraryFile do

permit_params :name, :description, :user_id
actions :all, except: [:new]

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end

    f.submit
  end

  index do
    selectable_column

    column :name
    column :user

    actions
  end

end

