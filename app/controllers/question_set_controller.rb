class QuestionSetController < ApplicationController
  before_filter :authenticate_teacher!
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_exam

  respond_to :html

  def index
    @question_sets = Question_set.where(exam_id: @question_set.id)
    respond_with(@question_sets)
  end

  def show
    respond_with(@question_set)
  end

  def new
    @question_set = Question_set.new
    respond_with(@question_set)
  end

  def edit
  end

  def create
    @question_set = Question_set.new(question_params)
    @question_set.exam_id = @question_set.id
    @question_set.save
    respond_with(@question_set)
  end

  def update
    @question_set.update(question_set_params)
    respond_with(@question_set)
  end

  def destroy
    @question_set.destroy
    respond_with(@question_set)
  end

  private
    def set_question
      @question_set = Question_set.find(params[:id])
    end

    def set_exam
      @question_set = Question_set.find(params[:exam_id])
    end

    def question_set_params
      params.require(:question_set).permit(:sub_id, :sub_name, :no_of_ques)
    end
end
