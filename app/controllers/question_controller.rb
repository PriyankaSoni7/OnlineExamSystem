class QuestionController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :take_exam, :check]
  before_action :authenticate_teacher!, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,only: [:take_exam]

  @questions = Question.all
  if @questions.length >= 15
    @@questions = Question.order('RANDOM()').limit(15)
  else
    @@questions = Question.order('RANDOM()')
  end
  
  respond_to :html

  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    @questions = Question.where(exam_id: @question.id)
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.save
    respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

  def take_exam
    if session[:count].nil?
      session[:count] = 0
    end
    @step = @@questions[session[:count]] 
  end

  def check    
    session[:correct] ||= 0
    session[:total_possible_marks] ||= 0
    session[:user_marks] ||= 0
    if params[:answer] == @@questions[session[:count]].answer
      session[:correct] += 1
      session[:user_marks] += @@questions[session[:count]].marks
    end
    session[:total_possible_marks] += @@questions[session[:count]].marks
    session[:count] += 1
    @step = @@questions[session[:count]]
    if @step.nil?
      redirect_to exam_current_result_path(@question) 
    else
      redirect_to :action => "take_exam" 
    end 
  end

  def result
    @question = Question.find(params[:exam_id])
    @correct = session[:correct]
    @total_marks = session[:user_marks]
    @total_possible_marks = session[:total_possible_marks]
    @possible = @@questions.length

    @submit = Submit.create(question_id: params[:question_id],user_id: current_user.id,score: @total_marks,max_score: @total_possible_marks)
    
    session.clear
    @questions = Question.all
    if @questions.length >= 15
      @@questions = Question.order('RANDOM()').limit(15)
    else
      @@questions = Question.order('RANDOM()')
    end
  end
  
  private
    def set_exam
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:ques_no, :first_option, :second_option, :third_option, :fourth_option, :answer, :time_limit)
    end
end
