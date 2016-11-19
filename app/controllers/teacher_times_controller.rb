class TeacherTimesController < ApplicationController
	HEADER = %w[Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье]
	TIME = %w[07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 00 01 02 03 04 05 06]

	def index
		@students = User.where(teacher_id: current_user.id)
    @teacher_time = TeacherTime.new
 	  @days_of_week = HEADER
 	  @times = TIME
	end

  def show
  	set_teacher_time
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
    @teacher_time = TeacherTime.new(teacher_time_params)
      if @teacher_time.save
        redirect_to teacher_times_path
      else
        redirect_to teacher_times_path
      end
  end

  def update
    @teacher_time = TeacherTime.find(params[:id])
      if @teacher_time.update_attributes(teacher_time_params)
        redirect_to teacher_times_path
      else
        redirect_to teacher_times_path
      end
  end

  def destroy
    @teacher_time.destroy
  end

  private
    def set_teacher_time
      @teacher_time = TeacherTime.find(params[:id])
    end

    def teacher_time_params
      params.require(:teacher_time).permit(:time, :day_of_week, :student_id, :teacher_id, :status_time_teacher_id)
    end
end