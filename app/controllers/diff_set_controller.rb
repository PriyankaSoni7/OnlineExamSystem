class DiffSetController < ApplicationController
  def index
    @diff_sets = Diff_set.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diff_sets }
    end
  end

  # GET /diff_sets/1
  # GET /diff_sets/1.json
  def show
    @diff_set = Diff_set.find(params[:id])
  end

  # GET /diff_sets/new
  # GET /diff_sets/new.json
  def new
    @diff_set = Diff_set.new
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] }
    @ques_sets = Question_set.all.collect { |question_set| [question_set.name, question_set.sub_id] }

  end

  # POST /diff_sets
  # POST /diff_sets.json
  def create
    @diff_set = Diff_setr.new(params[:diff_set])
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] }
    @ques_sets = Question_set.all.collect { |question_set| [question_set.name, question_set.sub_id] }

    if @diff_set.save
      diff_sets = Diff_set.where("subject_id=?", @diff_set.subject_id)
      i = 3;

      while i > 0 do
        content = Content.new
        content.question = questions[i]
        content.diff_set = @diff_set
        content.save

        i = i - 1
      end

      examinees = Examinee.where("examinee_id=?", @diff_set.faculty_id)
      examinees.each do |stu|
        p "1111111111111111111#{stu.name}"
        p "2222222222222222222#{@diff_set.id}" 
        test = Test.new
        test.examinee = exa
        test.diff_set = @diff_set

        test.save
      end
      flash.now[:success] = "Success."
      redirect_to @diff_set
    else
      render new
    end
end
