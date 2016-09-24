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

end
