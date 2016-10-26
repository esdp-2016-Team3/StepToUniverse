class HomeworkQuestionsController < ApplicationController
  def index
    @homework_questions = HomeworkQuestion.all

    respond_to do |format|
      format.html 
      format.json { render json: @homework_questions }
    end
  end

  def edit
    @homework_question = HomeworkQuestion.find(params[:id])
  end

  def show
    @homework_question = HomeworkQuestion.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @homework_question }
    end
  end

  def new
    @homework_question = HomeworkQuestion.new
    @homework_question.homework_answers.build

    respond_to do |format|
      format.html 
      format.json { render json: @homework_question }
    end
  end

  def create
    @homework_question = HomeworkQuestion.new(homework_question_params)

    respond_to do |format|
      if @homework_question.save
        format.html { redirect_to @homework_question, notice: 'homework_question was successfully created.' }
        format.json { render json: @homework_question, status: :created, location: @homework_question }
      else
        format.html { render action: "new" }
        format.json { render json: @homework_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @homework_question = HomeworkQuestion.find(params[:id])

    respond_to do |format|
      if @homework_question.update_attributes(params[:homework_question])
        format.html { redirect_to @homework_question, notice: 'homework_question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @homework_question.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def homework_question_params
      params.require(:homework_question).permit(:title,  
                                       homework_answers_attributes: [:id, 
                                                            :title, 
                                                            :homework_question_id, 
                                                            :_destroy, 
                                                            :is_correct])
  end 
end
