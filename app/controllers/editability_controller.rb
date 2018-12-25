class EditabilityController < ApplicationController
  # GET /editabilitys
  # GET /editabilitys.json
  def index
    current_user = User.find_by_remember_token(cookies[:remember_token])
    @editabilitys = Editability.where(current_user)
  end

  # GET /editabilitys/1
  # GET /editabilitys/1.json
  def show
    @editability = Editability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test }
    end
  end

  # GET /editabilitys/new
  # GET /editabilitys/new.json
  def new
    @editability = Editability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @editability }
    end
  end

  # GET /editabilitys/1/edit
  def edit
    @editability = Editability.find(params[:id])
  end

  # POST /editabilitys
  # POST /editabilitys.json
  def create
    @editability = Editability.new(params[:test])

    respond_to do |format|
      if @editability.save
        format.html { redirect_to @editability, notice: 'Test was successfully created.' }
        format.json { render json: @editability, status: :created, location: @test }
      else
        format.html { render action: "new" }
        format.json { render json: @editability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /editabilitys/1
  # PUT /editabilitys/1.json
  def update
    @editability = Editability.find(params[:id])

    respond_to do |format|
      if @editability.update_attributes(params[:editability])
        format.html { redirect_to @editability, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @editability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editabilitys/1
  # DELETE /editabilitys/1.json
  def destroy
    @editability = Editability.find(params[:id])
    @editability.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end
end
