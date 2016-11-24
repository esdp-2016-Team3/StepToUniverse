class LessonsController < ApplicationController
  def index
  end

  def new
  	@teacher_time = TeacherTime.find(params[:id])
  	@lesson = Lesson.new
  end

  def create
  	@lesson = Lesson.new(lesson_params)
  end

  private

  	def lesson_params
    	params.require(:lesson).permit(:teacher_id, :student_id, :day_of_week, :time)
  	end
end
