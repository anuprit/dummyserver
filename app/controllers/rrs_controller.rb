class RrsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :has_app_access
  # GET /rrs
  # GET /rrs.json
  def index
    @rrs = Rr.find_all_by_application_id(@application.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rrs }
    end
  end

  # GET /rrs/1
  # GET /rrs/1.json
  def show
    @rr = get_my_rr(params[:id], current_user.id)
    @headers = Header.find_all_by_rr_id(@rr.id)
    @parameters = Parameter.find_all_by_rr_id(@rr.id)

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
    #@rr.user_id = current_user.id
    @rr.application_id = @application.id

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
    @rr = get_my_rr(params[:id], current_user.id)

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
    @rr = get_my_rr(params[:id], current_user.id)
    @rr.destroy

    respond_to do |format|
      format.html { redirect_to rrs_url }
      format.json { head :no_content }
    end
  end

  private
  def has_app_access
    @application = Application.does_user_has_app_access(current_user.id, params[:app_id])
  end

  def get_my_rr(id, user_id)
    rr = Rr.where("id = ?", id).first
    @application = Application.where("id = ?", rr.application_id).first
    return rr if @application.user_id == user_id
  end
end
