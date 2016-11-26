class TeacherTimesController < ApplicationController
	def index

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

  def timetable
    @user = User.find(params[:id])
    @students = User.where(teacher_id: @user.id)
    @teacher_time = TeacherTime.new
    @days_of_week = DAYS_OF_THE_WEEK
    @times = TIME
  end

  def create
    @teacher_time = TeacherTime.new(teacher_time_params)
      if @teacher_time.save
        redirect_to timetable_path(current_user)
      else
        redirect_to timetable_path(current_user)
        flash[:notice] = 'Изменений не произошло.'
      end
  end

  def update
    set_teacher_time
      if @teacher_time.update_attributes(teacher_time_params)
        redirect_to timetable_path(current_user)
      else
        redirect_to timetable_path(current_user)
        flash[:notice] = 'Изменений не произошло.'
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