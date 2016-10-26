class SurveysController < ApplicationController
	def new
	  @survey = Survey.new
    @question = @survey.homework_questions.build
    @question.homework_answers.build
  end
	end

  def show
    @survey = Survey.find(params[:id])
  end

	def create
    @survey = Survey.new(survey_params)
	  respond_to do |format|
	    if @survey.save
	      format.html { redirect_to @survey, notice: 'survey was successfully created.' }
	      format.json { render json: @survey, status: :created, location: @survey }
        format.xml  { render xml: @survey, status: :created, location: @survey }
	    else
	      format.html { render action: "new" }
	      format.json { render json: @survey.errors, status: :unprocessable_entity }
	    end
	  end
  end

  private

  def survey_params
    params.require(:survey).permit(:name, 
      							     homework_questions_attributes: [:id, 
      								                        :title, 
      								                        :survey_id, 
      								                        :_destroy,
      								   homework_answers_attributes: [:id, 
                                              :title, 
                                              :question_id, 
                                              :_destroy, 
                                              :is_correct]])
  	end
end
