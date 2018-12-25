class SubmitController < ApplicationController
  before_action :set_exam
  before_filter :authenticate_teacher!

  def index
    @submits = Submit.where(question_set_id: @question_set.id).order('score DESC')
    respond_to do |format|
      format.html
      format.csv { send_data @submits.to_csv }
      format.xls { send_data @submits.to_csv(col_sep: "\t") }
    end
  end

  def user_id
  end

  private
    def set_exam
      @question_set = Question_set.find(params[:sub_id, :sub_name, :no_of_ques, :examinee_id)
    end

    def submit_params
      params.require(:submit).permit(:no_of_ques_attempt)
    end	
end
