class HomeworksController < ApplicationController
  
  def create
    @homework = Homework.new(homework_params)

    redirect_to cabinet_path, notice: 'Домашнее задание успешно отправлено.'
  end

  private

  def homework_params
    params.require(:homework).permit(:title, :user_id, :text_files)
  end

end