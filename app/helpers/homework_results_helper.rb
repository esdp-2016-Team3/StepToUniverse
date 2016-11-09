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

	def homework_type(homework_id)
		homework = Homework.find(homework_id)
		homework.type_homework
	end
	
end
