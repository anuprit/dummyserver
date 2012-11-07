class RrsController < ApplicationController
  before_filter :authenticate_user!

  # GET /rrs
  # GET /rrs.json
  def index
    @rrs = Rr.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rrs }
    end
  end

  # GET /rrs/1
  # GET /rrs/1.json
  def show
    @rr = Rr.where("id = ? and user_id =?", params[:id], current_user.id).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rr }
    end
  end

  # GET /rrs/new
  # GET /rrs/new.json
  def new
    @rr = Rr.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rr }
    end
  end

  # GET /rrs/1/edit
  def edit
    @rr = Rr.find(params[:id])
  end

  # POST /rrs
  # POST /rrs.json
  def create
    @rr = Rr.new(params[:rr])
    @rr.user_id = current_user.id

    respond_to do |format|
      if @rr.save
        format.html { redirect_to @rr, notice: 'Rr was successfully created.' }
        format.json { render json: @rr, status: :created, location: @rr }
      else
        format.html { render action: "new" }
        format.json { render json: @rr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rrs/1
  # PUT /rrs/1.json
  def update
    @rr = Rr.where("id = ? and user_id = ?", params[:id], current_user.id).first

    respond_to do |format|
      if @rr.update_attributes(params[:rr])
        format.html { redirect_to @rr, notice: 'Rr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rrs/1
  # DELETE /rrs/1.json
  def destroy
    @rr = Rr.where("id = ? and user_id =?", params[:id], current_user.id).first
    @rr.destroy

    respond_to do |format|
      format.html { redirect_to rrs_url }
      format.json { head :no_content }
    end
  end
end
