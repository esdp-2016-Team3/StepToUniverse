class FilesController < ApplicationController
  
  def create
    @text_file = Text_file.new(text_file_params)
    @asd = params[:text_file]
    @asd = @asd[:file]
    @asd = @asd.original_filename
    @text_file.pather = @asd
    @text_file.save

    redirect_to literature_list_path, notice: 'Успешно создано.'
  end

  def destroy
    @text_file = Text_file.find(params[:id])
    @text_file.destroy
    redirect_to literature_list_path, notice: 'Успешно удалено.'
  end

  private

  def text_file_params
    params.require(:text_file).permit(:name, :description, :file, :pather)
  end

end