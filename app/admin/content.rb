ActiveAdmin.register Content do

permit_params :title, :description

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :ckeditor
    end

    f.submit
  end

  index do
    selectable_column
    column :title

    actions
  end

end

ActiveAdmin.register TextFile do

permit_params :name, :status, :description

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :status
      f.input :file, as: :file
    end

    f.submit
  end

  index do
    selectable_column
    column :name

    actions
  end

end

