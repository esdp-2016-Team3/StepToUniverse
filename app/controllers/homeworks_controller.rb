class HomeworksController < ApplicationController
  
  def create
    params[:homework][:text_files_attributes].each do |at|
      @a = params[:homework][:text_files_attributes][at.to_sym][:file]
      @a = @a.original_filename
      params[:homework][:text_files_attributes][at.to_sym][:pather] = @a
    end

    @homework = Homework.new(homework_params)

    if @homework.save

      redirect_to cabinet_path, notice: 'Домашнее задание успешно отправлено.'
    else
      render 'cabinet'
    end
  end

  private

  def homework_params
    params.require(:homework).permit(:title, :user_id, text_files_attributes: [:id, :name, :description, :file, :pather, :homework_id])
  end

end