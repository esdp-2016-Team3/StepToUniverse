class ContentsController < ApplicationController
	def show
		@content = Content.find(params[:id])
	end
end
