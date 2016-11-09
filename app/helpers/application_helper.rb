module ApplicationHelper

	def flash_messages(opts = {})
		flash.each do |msg_type, message|
			concat(content_tag(:div, message, class: "alert alert-#{msg_type} fade in alert-dismissible") do
				concat content_tag(:button, 'x', class: "close", data: {dismiss: 'alert'})
				concat message
			end)
		end
		nil
	end

  def homework(homework_assignment)
    homework = Homework.find(homework_assignment.homework_id)
  end

  def homework_type(homework_id)
    homework = Homework.find(homework_id)
    homework.type_homework
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder, dynamic: true)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
