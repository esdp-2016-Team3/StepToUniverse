class HomeworkResultsController < ApplicationController

  def result_homework
    if @homework_result = HomeworkResult.new(result_params)
      @result_file = params[:homework_result][:file]
      @result_file = @result_file.original_filename 
      @homework_result.pather = @result_file

      assignment = HomeworkAssignment.find(@homework_result.homework_assignment_id)
      assignment.update!(homework_status_id: 2)
      @homework_result.save

      redirect_to student_cabinet_path(current_user), notice: 'Домашнее задание успешно завершено.'
    else
      render 'cabinet'
    end
  end

  def new
    if current_user
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
    params.require(:homework_result).permit(:id, :description, :file, :pather, :homework_assignment_id)
  end

end