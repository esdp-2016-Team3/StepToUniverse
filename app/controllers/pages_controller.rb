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

  def result
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

  def literature_list
    @text_files = Text_file.all
  end
  
end
