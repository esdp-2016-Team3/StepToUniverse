module PagesHelper
  include Levels
  
  def counting_result(params)
    arr = []
    @answers = []

    @level_1 = []
    @level_2 = []
    @level_3 = []
    @level_4 = []

    params.values.each do |value|
      if value.to_i != 0
        arr.push value.to_i
      end
    end

    arr.each do |elem|
      @answers.push Answer.find(elem)
    end

    @answers.each do |answer|
      if answer.is_correct == true
        if answer.question.level.id == 1
          @level_1.push answer
        elsif answer.question.level.id == 2
          @level_2.push answer
        elsif answer.question.level.id == 3
          @level_3.push answer
        elsif answer.question.level.id == 4
          @level_4.push answer
        end
      end
    end

    beginner = Beginner.new('Beginner', @level_1.count)
    elementary = Elementary.new('Elementary', @level_2.count)
    intermediate = Intermediate.new('Intermediate', @level_3.count)
    upper = UpperIntermediate.new('Upper-Intermediate', @level_4.count)

    array_levels = [beginner, elementary, intermediate, upper]
  end

	def homeworks_student(user_id)
		homework_assignments = []
    homework_assignment = HomeworkAssignment.where(user_id: user_id).order(:created_at => "desc")
		homework_assignment.each do |hwa|
      # binding.pry
      if hwa.homework.user_id == hwa.user.teacher_id.to_i and current_user.position_id == 2
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
    current_user.teacher_id == teacher
  end

  def student_timetable(user)
    student_timetable = TeacherTime.where(student_id: user)
  end
end
