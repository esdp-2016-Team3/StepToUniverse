ActiveAdmin.register Question do

  permit_params :content, :level_id, :is_active, answers_attributes: [:id, :content, :question_id, :_destroy, :is_correct]

  form  do |f|

    f.inputs 'Question' do
      f.input :content
      f.input :is_active
      f.input :level

    end
    f.inputs 'Answer' do
      f.has_many :answers, new_record: true, allow_destroy: true do |a|
        a.input :content
        a.input :is_correct, as: :radio, input_html: {value: :question_id}
      end
    f.actions
    end
  end
end
