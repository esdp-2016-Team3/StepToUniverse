module TeacherTimesHelper
	def selection_of_the_cell(time, day)
		teacher_time = TeacherTime.where(time: time, day_of_week: day)
		teacher_time.last
	end

	def list_of_students(students)
		students_list = []
		students.each do |student|
			students_list << student.name
		end
		return students_list
	end

	def status_teacher_time(teacher_time)
		status_time_teacher = StatusTimeTeacher.find(teacher_time.status_time_teacher_id)
		status_time_teacher.status_time
	end
end
