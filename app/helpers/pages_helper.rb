module PagesHelper

	# def homeworks_student(homework_assignment)
	# 	homeworks = []
	#
	# 	homework_assignment.each do |h|
  	# 		homeworks << Homework.find(h.homework_id)
   #  end
  #
   #  return homeworks
	# end

	def status_homework(homework)
    status_id = homework.homework_assignments.first.id
    find_status = HomeworkStatus.find(status_id)
    find_status.status
  end

end
