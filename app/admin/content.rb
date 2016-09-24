ActiveAdmin.register Content do

permit_params :title, :description

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :html_editor
    end

    f.submit
  end

end
