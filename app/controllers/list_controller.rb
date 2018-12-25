class ListController < ApplicationController
  before_action :set_exam
  before_filter :authenticate_teacher!

  def index
    @lists = List.where(list_id: @list.id).order('score DESC')
    respond_to do |format|
      format.html
      format.csv { send_data @lists.to_csv }
      format.xls { send_data @lists.to_csv(col_sep: "\t") }
    end
  end

  def user_id
  end

  private
    def set_exam
      @submit = submit.find(params[:no_of_ques_attempt)
    end

    def list_params
      params.require(:list).permit(:l_id, :marks, :pass, :fail)
    end	
end
