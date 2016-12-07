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

	def check_student(teacher_time)
		student_id = teacher_time.student_id
		student = User.find(student_id)
		student.teacher_id.to_i == current_user.id
	end

	def teacher_name(teacher_time)
		teacher_id = teacher_time.teacher_id
		teacher = User.find(teacher_id)
		teacher.name
	end

	def status_teacher_time(teacher_time)
		status_time_teacher = StatusTimeTeacher.find(teacher_time.status_time_teacher_id)
		status_time_teacher.status_time
	end
end
