module SearchForAnswers
require 'pry'

	def levels(array, correct_questions_count, level_name)

	  all_questions = array
	  answers_id = []

	  all_questions.each do |id_question|
	    question = Question.find(id_question)
	    # if question.level.name ==  level_name
	      answer_correct = question.answers.where(is_correct: true)
	      answer_correct.each {|ans_corr| answers_id.push ans_corr.id}
	    # else
	      # answer = question.answers.where(is_correct: false)
	      # answer.each {|ans_corr| answers_id.push ans_corr.id}
	    # end
	  end
	  return answers_id
	end
end
