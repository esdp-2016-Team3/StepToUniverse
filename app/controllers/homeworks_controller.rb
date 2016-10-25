class HomeworksController < ApplicationController
  def create
    params[:homework][:homework_files_attributes].each do |at|
      @a = params[:homework][:homework_files_attributes][at.to_sym][:file]
      @a = @a.original_filename
      params[:homework][:homework_files_attributes][at.to_sym][:pather] = @a
    end
    @homework = Homework.new(homework_params)
    @homework.user_id = current_user.id if current_user
    if @homework.save
      redirect_to teacher_homeworks_path, notice: 'Домашнее задание успешно создано.'
    else
      render 'cabinet'
    end
  end

  def destroy
    @homework = Homework.find(params[:id])
    @homework.destroy
    
    redirect_to teacher_homeworks_path, notice: 'Успешно удалено.'
  end

  def assign
    if HomeworkAssignment.create(assignment_params)
      redirect_to cabinet_path, notice: 'Домашнее задание успешно отправлено.'
    else
      render 'cabinet'
    end
  end

  def result
    if @assign = HomeworkResult.create(result_params)
      @assign = @assign.homework_assignment
      @assign.is_done = true
      @assign.save
      redirect_to cabinet_path, notice: 'Домашнее задание успешно завершено.'
    else
      render 'cabinet'
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

  def homework_params
    params.require(:homework).permit(:title, :user_id, homework_files_attributes: [:id, :name, :description, :file, :pather, :homework_id])
  end

  def assignment_params
    params.require(:homework_assignment).permit(:user_id, :homework_id)
  end

  def result_params
    params.require(:homework_result).permit(:is_checked, :homework_assignment_id)
  end

end