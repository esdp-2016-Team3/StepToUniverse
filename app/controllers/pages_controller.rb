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

  def method_name
    
  end

end
