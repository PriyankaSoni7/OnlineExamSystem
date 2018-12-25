class LevelController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :take_exam, :check]
  before_action :authenticate_teacher!, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,only: [:take_exam]

  @levels = Level.all
  if @levels.length >= 15
    @@levels = Level.order('RANDOM()').limit(15)
  else
    @@levels = Level.order('RANDOM()')
  end
  
  respond_to :html

  def index
    @levels = Level.all
    respond_with(@levels)
  end

  def show
    @levels = Level.where(level_id: @level.id)
    respond_with(@level)
  end

  def new
    @level = Level.new
    respond_with(@level)
  end

  def edit
  end

  def create
    @level = Level.new(level_params)
    @level.save
    respond_with(@level)
  end

  def update
    @level.update(level_params)
    respond_with(@level)
  end

  def destroy
    @level.destroy
    respond_with(@level)
  end

  def take_exam
    if session[:count].nil?
      session[:count] = 0
    end
    @step = @@levels[session[:count]] 
  end

  def check    
    session[:correct] ||= 0
    session[:total_possible_marks] ||= 0
    session[:user_marks] ||= 0
    if params[:answer] == @@levels[session[:count]].answer
      session[:correct] += 1
      session[:user_marks] += @@levels[session[:count]].marks
    end
    session[:total_possible_marks] += @@levels[session[:count]].marks
    session[:count] += 1
    @step = @@levels[session[:count]]
    if @step.nil?
      redirect_to exam_current_result_path(@level) 
    else
      redirect_to :action => "take_exam" 
    end 
  end

  def result
    @level = Level.find(params[:exam_id])
    @correct = session[:correct]
    @total_marks = session[:user_marks]
    @total_possible_marks = session[:total_possible_marks]
    @possible = @@lists.length

    @submit = Submit.create(exam_id: params[:exam_id],user_id: current_user.id,score: @total_marks,max_score: @total_possible_marks)
    
    session.clear
    @levels = Level.all
    if @levels.length >= 15
      @@levels = Level.order('RANDOM()').limit(15)
    else
      @@levels = Level.order('RANDOM()')
    end
  end
  
  private
    def set_exam
      @level = Level.find(params[:id])
    end

    def level_params
      params.require(:exam).permit(:id, :fresher, :intermediate, :experienced , :signup_id)
    end
end
