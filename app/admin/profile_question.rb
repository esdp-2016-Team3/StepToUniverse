ActiveAdmin.register ProfileQuestion do

  permit_params :question

  form  do |f|

    f.inputs 'Question' do
      f.input :question
      f.actions
    end
  end

  index do
    selectable_column
    column :question
  end

end
