class ProfileController < ApplicationController
  before_action :authenticate_user!

  def create
  	@profile_answer = ProfileAnswer.new(answer_params)
  	if @profile_answer.save
  		# redirect_to show_lesson_path(@lesson)
  		# flash[:notice] = 'Отчет успешно отправлен.'
  	else
  		# redirect_to timetable_path(current_user)
    #   flash[:notice] = 'Отчет не был отправлен.'
  	end
  end

  private

  def answer_params
    params.require(:profile_answer).permit(:answer, :profile_question_id)
  end
end
