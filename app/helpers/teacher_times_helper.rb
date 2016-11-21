module TeacherTimesHelper
	def selection_of_the_cell(time, day)
		teacher_time = TeacherTime.where(time: time, day_of_week: day)
		teacher_time.last
	end

	def student_name(teacher_time)
		student_id = teacher_time.student_id
		student = User.find(student_id)
		student.name
	end

	def status_teacher_time(teacher_time)
		status_time_teacher = StatusTimeTeacher.find(teacher_time.status_time_teacher_id)
		status_time_teacher.status_time
	end
end
