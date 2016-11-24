class LessonsController < ApplicationController
  def index
  end

  def new
  	@teacher_time = TeacherTime.find(params[:id])
  	@lesson = Lesson.new
  end

  def show
		@lesson = Lesson.find(params[:id])
	end

  def create
  	@lesson = Lesson.new(lesson_params)
  	if @lesson.save
  		redirect_to show_lesson_path(@lesson)
  		flash[:notice] = 'Отчет успешно отправлено.'
  	else
  		resirect_to timetable_path(current_user)
      flash[:notice] = 'Отчет не был отправлен.'
  	end
  end

  private

  	def lesson_params
    	params.require(:lesson).permit(:teacher_id, :student_id, :day_of_week, :time, :teacher_time_id)
  	end
end
