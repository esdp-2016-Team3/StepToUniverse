module HomeworkResultsHelper
	def homework_result(homework_id)
    homework_assignment = HomeworkAssignment.find(homework_id)
    assignment_id = homework_assignment.id
	end
end
