class LibraryFilesController < ApplicationController
  before_action :authenticate_user!

  def create
    @library_file = LibraryFile.new(library_file_params)
    if @library_file.save
      redirect_to teacher_literature_path, notice: 'Успешно создано.'
    else
      redirect_to teacher_literature_path, notice: 'Формат не поддерживается или название не может быть пустым'
    end
  end

  def destroy
    @library_file = LibraryFile.find(params[:id])
    @library_file.destroy
    
    redirect_to teacher_literature_path, notice: 'Успешно удалено.'
  end

  private

  def library_file_params
    params.require(:library_file).permit(:name, :description, :literature, :user_id)
  end
end
