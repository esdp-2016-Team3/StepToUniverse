class QuestionsForStudentsController < ApplicationController
  def index
    @questions_for_students = QuestionsForStudent.all

    respond_to do |format|
      format.html 
      format.json { render json: @questions_for_students }
    end
  end

  def edit
    @questions_for_student = QuestionsForStudent.find(params[:id])
  end

  def show
    @questions_for_student = QuestionsForStudent.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @questions_for_student }
    end
  end

  def new
    @questions_for_student = QuestionsForStudent.new
    @questions_for_student.answers_for_students.build

    respond_to do |format|
      format.html 
      format.json { render json: @questions_for_student }
    end
  end

  def create
    @questions_for_student = QuestionsForStudent.new(questions_for_student_params)

    respond_to do |format|
      if @questions_for_student.save
        format.html { redirect_to @questions_for_student, notice: 'questions_for_student was successfully created.' }
        format.json { render json: @questions_for_student, status: :created, location: @questions_for_student }
      else
        format.html { render action: "new" }
        format.json { render json: @questions_for_student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @questions_for_student = QuestionsForStudent.find(params[:id])

    respond_to do |format|
      if @questions_for_student.update_attributes(params[:questions_for_student])
        format.html { redirect_to @questions_for_student, notice: 'questions_for_student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questions_for_student.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def questions_for_student_params
      params.require(:questions_for_student).permit(:title,  
                                       answers_for_students_attributes: [:id, 
                                                            :title, 
                                                            :questions_for_student_id, 
                                                            :_destroy, 
                                                            :is_correct])
  end 
end
