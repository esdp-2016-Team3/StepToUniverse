class PagesController < ApplicationController

before_action :block

	def home
		
	end

private

def block
	if current_user == nil
		redirect_to new_user_session_path
	end
end

end
