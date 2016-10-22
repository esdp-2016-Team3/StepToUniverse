class LibraryFilesController < ApplicationController
  def create
    @library_file = LibraryFile.new(library_file_params)
    @library_file.user_id = current_user.id if current_user
      @file = params[:library_file][:file]
      @file = @file.original_filename
    @library_file.pather = @file
    @library_file.save

    redirect_to literature_list_path, notice: 'Успешно создано.'
  end

  def destroy
    @library_file = LibraryFile.find(params[:id])
    @library_file.destroy
    redirect_to literature_list_path, notice: 'Успешно удалено.'
  end

  private

  def library_file_params
    params.require(:library_file).permit(:name, :description, :file)
  end
end
