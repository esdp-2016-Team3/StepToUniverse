class QuestionsController < ApplicationController
  def index
    @questions = Question.all

    respond_to do |format|
      format.html 
      format.json { render json: @questions }
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @question }
    end
  end

  def new
    @question = Question.new

    @question.answers.build

    respond_to do |format|
      format.html 
      format.json { render json: @question }
    end
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def question_params
      params.require(:question).permit(:content, 
                                       :level_id, 
                                       :is_active, 
                                       answers_attributes: [:id, 
                                                            :content, 
                                                            :question_id, 
                                                            :_destroy, 
                                                            :is_correct])
  end 

end
