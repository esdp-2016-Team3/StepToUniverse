class HomeworkFilesController < ApplicationController
	# def create
 #    @text_file = Homework.new(text_file_params)
 #    @text_file.user_id = current_user.id if current_user
 #    @file = params[:text_file]
 #    @file = @file[:file]
 #    @file = @file.original_filename
 #    @text_file.pather = @file
 #    @text_file.save
 #    redirect_to literature_list_path, notice: 'Успешно создано.'
 #  end

 #  def destroy
 #    @text_file = Homework.find(params[:id])
 #    @text_file.destroy
 #    redirect_to literature_list_path, notice: 'Успешно удалено.'
 #  end

 #  private

 #  def text_file_params
 #    params.require(:text_file).permit(:name, :description, :file, :pather)
 #  end
end
