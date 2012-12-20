class SubpostsController < ApplicationController
  # GET /subposts
  # GET /subposts.json
  def index
    @subposts = Subpost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subposts }
    end
  end

  # GET /subposts/1
  # GET /subposts/1.json
  def show
    @subpost = Subpost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subpost }
    end
  end

  # GET /subposts/new
  # GET /subposts/new.json
  def new
    @subpost = Subpost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subpost }
    end
  end

  # GET /subposts/1/edit
  def edit
    @subpost = Subpost.find(params[:id])
  end

  # POST /subposts
  # POST /subposts.json
  def create
    @subpost = Subpost.new(params[:subpost])

    respond_to do |format|
      if @subpost.save
        format.html { redirect_to project_url(@subpost.post.project_id, :page => 'phase', :phase => @subpost.post.phase, notice: 'Subpost was successfully created.') }
        format.json { render json: @subpost, status: :created, location: @subpost }
      else
        format.html { render action: "new" }
        format.json { render json: @subpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subposts/1
  # PUT /subposts/1.json
  def update
    @subpost = Subpost.find(params[:id])

    respond_to do |format|
      if @subpost.update_attributes(params[:subpost])
        format.html { redirect_to @subpost, notice: 'Subpost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subposts/1
  # DELETE /subposts/1.json
  def destroy
    @subpost = Subpost.find(params[:id])
    @subpost.destroy

    respond_to do |format|
      format.html { redirect_to subposts_url }
      format.json { head :no_content }
    end
  end
end
