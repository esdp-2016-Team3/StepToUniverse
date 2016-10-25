class PagesController < ApplicationController
  
  include Levels
  include Results

  def sample_test
    @questions = []
    level = Level.all.count
    count = 1

    level.times do 
      @question = Question.where(level_id: count, is_active: true).order("RANDOM()").limit(5)
      @question.each do |question|
        @questions.push question
      end
      count += 1
    end

    @questions = @questions.shuffle
  end

  def result
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

    result_new = Result.new
    @result = result_new.define(array_levels)
  
  end
  
  def literature_list
    @library_file = LibraryFile.new
    @library_files = LibraryFile.all
  end

  def cabinet
    if current_user
      if current_user.position_id == 2
        @homework = Homework.new
        @homework.homework_files.build
        @hw_assignment = HomeworkAssignment.new
        @pend_hws = []
        current_user.homeworks.each do |hw|
          hw.homework_assignments.each do |assignment|
            if assignment.homework_result != nil && assignment.homework_result.is_checked == false
              @pend_hws.push assignment.homework_result
            end
          end
        end
      elsif current_user.position_id == 1
        if current_user.homework_assignments.any?
          @hwa = current_user.homework_assignments.where(is_done: nil)
          @homework_result = HomeworkResult.new
          @hwd = current_user.homework_assignments.where(is_done: true)
        end
      end
    end
  end  

  def teacher_literature
    @literatures = LibraryFile.all.where(user_id: current_user.id)
    
  end

  def teachers
    @teachers = User.where(position_id: 2, status: 'active')
  end
  
end