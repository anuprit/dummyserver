class ParametersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_parameter, :except => [:create, :new]

  # GET /parameters/1
  # GET /parameters/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parameter }
    end
  end

  # GET /parameters/new
  # GET /parameters/new.json
  def new
    @parameter = Parameter.new
    @rr = Rr.where("id = ?", params[:rr_id]).first
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @parameter }
    end
  end

  # GET /parameters/1/edit
  def edit
  end

  # POST /parameters
  # POST /parameters.json
  def create
    @parameter = Parameter.new(params[:parameter])

    respond_to do |format|
      if @parameter.save
        @rr = Rr.find_by_id(params[:parameter][:rr_id])
        format.html { redirect_to @rr, notice: 'Parameter was successfully created.' }
        format.json { render json: @rr, status: :created, location: @rr }
      else
        format.html { render action: "new" }
        format.json { render json: @parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parameters/1
  # PUT /parameters/1.json
  def update
    respond_to do |format|
      if @parameter.update_attributes(params[:parameter])
        format.html { redirect_to @parameter, notice: 'Parameter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parameters/1
  # DELETE /parameters/1.json
  def destroy
    @parameter.destroy

    respond_to do |format|
      format.html { redirect_to parameters_url }
      format.json { head :no_content }
    end
  end

  private
  def find_parameter
    @rr = Rr.find_by_id(params[:rr_id])
    @paramter = Header.get_request_header(params[:id], @rr, current_user)
  end

end