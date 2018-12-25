class ExamineeController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @examinees = Examinee.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @examinee = Examinee.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @examinee = Examinee.new
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] }
  end

  # GET /users/1/edit
  def edit
    @examinee = Examinee.find(params[:id])
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] }
  end

  # POST /users
  # POST /users.json
  def create
    @examinee = Examinee.new(params[:examinee])
     @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] }

    if @examinee.save
      sign_in @examinee
      flash.now[:success] = "Weclome to online Exam."
      redirect_to @examinee
    else
      render 'new'
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @examinee= Examinee.find(params[:id])
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] }
    
    if @examinee.update_attributes(params[:examinee])
      flash[:success] = "Profile updated"
      sign_in @examinee
      redirect_to @examinee
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_user
      @examinee = Examinee.find(params[:id, :name, :address, :phone_no , :email, :admin_name)
      redirect_to(@examinee, notice: "You are only supposed to edit your own profile.") unless current_user?(@user)
    end
end
