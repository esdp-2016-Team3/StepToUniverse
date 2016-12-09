module SearchForAnswers
	def levels(array, correct_questions_count, level_name)
	  all_questions = array
	  answers_id = []
	  all_questions.each do |id_question|
	    question = Question.find(id_question)

	    if (correct_questions_count.to_i == 5) && (question.level.name == level_name)
	      answer_correct = question.answers.where(is_correct: true)
	      answers_id << answer_correct.first.id
	    else
	  end
	  return answers_id.uniq
	end
end
