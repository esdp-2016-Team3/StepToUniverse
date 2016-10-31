class HomeworkResultsController < ApplicationController

  def result_homework
    if @homework_result = HomeworkResult.new(result_params)
      @assign = @homework_result.homework_assignment
      @assign.status_id = 2
      @assign.save
      redirect_to student_cabinet_path, notice: 'Домашнее задание успешно завершено.'
    else
      render 'cabinet'
    end
  end

  def new
    if current_user
      binding.pry
        if current_user.homework_assignments.any?
          @homework_assignment = current_user.homework_assignments.where(status_id: 1)
          @homework_result = HomeworkResult.new
        end
    end
  end  

  def check
    @result = HomeworkResult.find(params[:id])
    if @result.update(result_params)
      redirect_to cabinet_path, notice: 'Домашнее задание успешно проверенно.'
    else
      render 'cabinet'
    end
  end

  private 

  def result_params
    params.require(:homework_result).permit(:homework_assignment_id)
  end

end
