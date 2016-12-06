module PagesHelper

	def homeworks_student(user_id)
		homework_assignments = []
    homework_assignment = HomeworkAssignment.where(user_id: user_id).order(:created_at => "desc")
		homework_assignment.each do |hwa|
      if hwa.homework.user_id == hwa.user.teacher_id and current_user.position_id == 2
  		  homework_assignments << hwa
      elsif current_user.position_id == 1
        homework_assignments << hwa
      end
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
    @counter = 0
    unchecked_homeworks.each do |unchecked_homework|
      if unchecked_homework.homework.user == current_user  and unchecked_homework.user.teacher_id == current_user.id
        @counter+=1
      end
    end
    return @counter
  end

  def check_teacher(table)
    teacher = table.teacher_id
    current_user.teacher_id == teacher.to_i
  end

  def student_timetable(user)
    student_timetable = TeacherTime.where(student_id: user)
  end
end
