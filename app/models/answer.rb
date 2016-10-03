# class AnswerValidator < ActiveModel::Validator

# 	def validation_on_correctness_of_answer(question)
# 		array_correct = []
# 		question.answers.each do |answer|
# 			array_correct.push answer.is_correct
# 	    end

# 	    array_true = []
# 	    array_correct.each do |array|
# 	    	if array == true
# 	    		array_true.push array
# 	        else
# 	        	nil
# 	        end
# 	    end

# 	    if array_true.size == 1
# 	       ""
# 	    elsif condition

# 	    else

# 	    end	
# 	end

# end

class Answer < ApplicationRecord
	belongs_to :question
	validates :content, :presence => true

	# validates :is_correct, validation_on_correctness_of_answer
end