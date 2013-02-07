class HeadersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_header, :except => [:create, :new]

  # GET /headers/1
  # GET /headers/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @header }
    end
  end

  # GET /headers/new
  # GET /headers/new.json
  def new
    @header = Header.new
    @rrs = current_user.rrs
    @rr = Rr.where("id = ?", params[:rr_id]).first
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @header }
    end
  end

  # GET /headers/1/edit
  def edit
  end

  # POST /headers
  # POST /headers.json
  def create
    @header = Header.new(params[:header])

    respond_to do |format|
      if @header.save
        @rr = Rr.find_by_id(params[:header][:rr_id])
        format.html { redirect_to @rr, notice: 'Header was successfully created.' }
        format.json { render json: @rr, status: :created, location: @rr }
      else
        format.html { render action: "new" }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /headers/1
  # PUT /headers/1.json
  def update
    respond_to do |format|
      if @header.update_attributes(params[:header])
        format.html { redirect_to @rr, notice: 'Header was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headers/1
  # DELETE /headers/1.json
  def destroy
    @header.destroy

    respond_to do |format|
      format.html { redirect_to headers_url }
      format.json { head :no_content }
    end
  end

  private
  def find_header
    @rr = Rr.find_by_id(params[:rr_id])
    @header = Header.get_request_header(params[:id], @rr, current_user)
  end
end
