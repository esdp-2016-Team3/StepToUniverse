module PagesHelper

	def homeworks_student(homework_assignment)
		homeworks = []
	
		homework_assignment.each do |h|
  			homeworks << Homework.find(h.homework_id)
    end
  
    return homeworks
	end

	def status_homework(homework)
    status_id = homework.homework_assignments.first.id
    find_status = HomeworkStatus.find(status_id)
    find_status.status
  end

  def accepted_homeworks
    unchecked_homeworks = HomeworkAssignment.where(homework_status_id: 2)
    @unchecked_homeworks = []
    @counter = 0
    unchecked_homeworks.each do |unchecked_homework|
      unchecked_homework.homework.user == current_user
      @unchecked_homeworks.push unchecked_homework
      @counter+=1
    end
    return @counter
  end
end
