class PagesController < ApplicationController

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

  def level_detection
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
  end

<<<<<<< refs/remotes/origin/development
  def literature_list
    @text_file = Text_file.new
    @text_files = Text_file.all
  end
  
=======
  def result
    level_detection()
      if @lvl_2.count == 5
        if @lvl_3.count == 5
           @level = @lvl_4.count > 2 ? 'Upper-Intermediate' : 'Intermediate'
        elsif @lvl_3.count > 1
          @level = 'Intermediate'
        else
          @level = 'Elementary'
        end
      elsif @lvl_2.count > 1
        @level = 'Elementary'
      else
        @level = 'Beginner'
      end
  end
>>>>>>> #30 Добавил функционал по созданию тестов преподавателем
end

 