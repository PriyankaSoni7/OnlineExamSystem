class UserController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] } 
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] } 
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] } 

    if @user.save
      sign_in @user
      flash.now[:success] = "Weclome to online Exam."
      redirect_to @user
    else
      render 'new'
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @examinees = Examinee.all.collect { |examinee| [examinee.name, examinee.id] } 
    
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
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
      @user = User.find(params[:id])
      redirect_to(@user, notice: "You are only supposed to edit your own profile.") unless current_user?(@user)
    end
  GET /resource/password/new
  def new
    super
  end

  POST /resource/password
  def create
    super
  end

  GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  PUT /resource/password
  def update
    super
  end

  protected

  def after_resetting_password_path_for(resource)
    super(resource)
  end

  The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end
end
