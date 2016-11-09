module HomeworkResultsHelper

	def homework_result(homework_id)
    homework_assignment = HomeworkAssignment.find(homework_id)
    assignment_id = homework_assignment.id
	end

	def search_for_answers(keys)
		answers_id = []
	  keys.each do |key|
	    if key.to_i != 0 
	    answers_id << key.to_i
	    end
	  end
	  array_answer_id_json = answers_id.to_json
	  return array_answer_id_json
	end

	def student_answers(answers)
		answers_student = []
		array_answers = JSON.parse answers
		array_answers.each do |answer_id|
			answers_student << answer_id
		end
		return answers_student
	end

	def status_answer(array, answer)
		array_answer = array.include? answer.id
		if array_answer
				if array_answer && answer.is_correct
					return "Студент ответил правильно"
				elsif array_answer
					return  "Ответ студента"
				
				end
		elsif answer.is_correct
					return "Правильный ответ"
		end
	end
end
