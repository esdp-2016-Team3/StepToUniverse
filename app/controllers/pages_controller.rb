class PagesController < ApplicationController
  
  include Levels
  include Results

	def homepage
		
	end

  def sample_test
    @questions = []
    @q = Question.where(level_id: 1, is_active: true).order("RANDOM()").limit(5)
    @q.each do |q|
      @questions.push q
    end

    @q = Question.where(level_id: 2, is_active: true).order("RANDOM()").limit(5)
    @q.each do |q|
      @questions.push q
    end

    @q = Question.where(level_id: 3, is_active: true).order("RANDOM()").limit(5)
    @q.each do |q|
      @questions.push q
    end

    @q = Question.where(level_id: 4, is_active: true).order("RANDOM()").limit(5)
    @q.each do |q|
      @questions.push q
    end

    @questions = @questions.shuffle
  end

  def result()
    arr = []
    @answers = []

    @lvl_1 = []
    @lvl_2 = []
    @lvl_3 = []
    @lvl_4 = []

    params.values.each do |k|
      if k.to_i != 0
        arr.push k.to_i
      end
    end

    arr.each do |n|
      @answers.push Answer.find(n)
    end

    @answers.each do |ans|
      if ans.is_correct == true
        if ans.question.level.id == 1
          @lvl_1.push ans
        elsif ans.question.level.id == 2
          @lvl_2.push ans
        elsif ans.question.level.id == 3
          @lvl_3.push ans
        elsif ans.question.level.id == 4
          @lvl_4.push ans
        end
      end
    end

    beginner = Beginner.new('Beginner', @lvl_1.count)
    elementary = Elementary.new('Elementary', @lvl_2.count)
    intermediate = Intermediate.new('Intermediate', @lvl_3.count)
    upper = UpperIntermediate.new('Upper-Intermediate', @lvl_4.count)

    array_levels = [beginner, elementary, intermediate, upper]
    result_new = Result.new
    @result = result_new.define(array_levels)
  
  end
  
  def literature_list
    @text_file = TextFile.new
    @text_files = TextFile.where(homework_id: nil)
  end

  def cabinet
    if current_user
      if current_user.position_id == 2
        @homework = Homework.new
        @homework.text_files.build
        @hw_assignment = HomeworkAssignment.new
        @pend_hws = []
        current_user.homeworks.each do |hw|
          hw.homework_assignments.each do |ass|
            if ass.homework_result != nil && ass.homework_result.is_checked == false
              @pend_hws.push ass.homework_result
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
  
end