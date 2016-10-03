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

