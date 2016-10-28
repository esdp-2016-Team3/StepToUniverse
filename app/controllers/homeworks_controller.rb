class HomeworksController < ApplicationController

  def index
    @homeworks = Homework.all
  end

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
      @assign.status_id = 2
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

  def new_homework_question
    @homework = Homework.new
    question = @homework.homework_questions.build
    question.homework_answers.build
  end

  def create_homework_question
    @homework = Homework.new(homework_params)
    @homework.user_id = current_user.id if current_user
    if @homework.save
      redirect_to teacher_homeworks_path, notice: 'Домашнее задание успешно создано.'
    else
      render 'cabinet'
    end
  end


  def show
    @homework = Homework.find(params[:id])
  end

  def record

  end

  private

  def homework_params
    params.require(:homework).permit(:title, :user_id, 
                         homework_files_attributes: [:id,
                                              :description, 
                                              :file,
                                              :pather, 
                                              :homework_id],
                         homework_questions_attributes: [:id, 
                                              :title, 
                                              :homework_id, 
                                              :_destroy,
                                              homework_answers_attributes: [:id, 
                                                                    :title, 
                                                                    :homework_question_id, 
                                                                    :_destroy, 
                                                                    :is_correct]])
  end

  def assignment_params
    params.require(:homework_assignment).permit(:user_id, :homework_id)
  end

  def result_params
    params.require(:homework_result).permit(:is_checked, :homework_assignment_id)
  end

end