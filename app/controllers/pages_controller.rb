class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:student_cabinet, :teacher_cabinet]

  include Levels
  include Results
  include PagesHelper
  include ApplicationHelper

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
    result_new = Result.new
    @result = result_new.define(counting_result(params))
  end
  
  def literature_list
    @library_files = LibraryFile.all
  end

  def student_cabinet
    @user_id = User.find(params[:id])
    @homework_assignment = homeworks_student(@user_id)
    @days_of_week = DAYS_OF_THE_WEEK
  end

  def teacher_cabinet
    @hw_assignment = HomeworkAssignment.new
  end

  def teacher_literature
    @literature = LibraryFile.new
    @literatures = LibraryFile.where(user_id: current_user.id)
  end

  def teachers
    @teachers = User.where(position_id: 2, status: 'active')
  end

  def my_students
    @students = User.where(teacher_id: current_user.id)
  end

  def teacher_homeworks
    @homeworks = Homework.where(user_id: current_user.id, is_deleted: nil)
  end
end