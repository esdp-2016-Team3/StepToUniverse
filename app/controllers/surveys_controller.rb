class SurveysController < ApplicationController
	def new
	  @survey = Survey.new
	  @survey.questions.build
	end

	def create
    @survey = Survey.new(survey_params)

	    respond_to do |format|
	      if @survey.save
	        format.html { redirect_to @survey, notice: 'survey was successfully created.' }
	        format.json { render json: @survey, status: :created, location: @survey }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @survey.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	private

  	def survey_params
      params.require(:survey).permit(:name, 
      							     questions_attributes: [:id, 
      								                        :content, 
      								                        :survey_id, 
      								                        :_destroy,
      								   answers_attributes: [:id, 
                                              :content, 
                                              :question_id, 
                                              :_destroy, 
                                              :is_correct]])
  	end
end
