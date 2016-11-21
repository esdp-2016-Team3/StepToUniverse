module PagesHelper

	def homeworks_student(user_id)
		homework_assignments = []
    homework_assignment = HomeworkAssignment.where(user_id: user_id)
		homework_assignment.each do |hwa|
  		homework_assignments << hwa
    end
    return homework_assignments
	end

	def status_homework(homework_assignment)
    status_id = homework_assignment.homework_status_id
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

  def student_timetable(user)
    a = TeacherTime.where(student_id: user)
    array = []
    a.each do |f|
      array << [f.time, f.day_of_week]
    end
    # binding.pry
  end
end
