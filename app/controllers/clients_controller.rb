class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])
    temp_password = 'temporary'
    @client.password ||= temp_password
    @client.password_confirmation ||= temp_password

    respond_to do |format|
      if @client.save
        format.html { redirect_to project_url(:id => @client.project_id, :page => 'options'), notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])

    project_id = @client.project_id

    # Destroy all the client's posts
    clients_posts = Post.where(:user_id => @client.id)
    clients_posts.each do |post|
      post.destroy
    end

    @client.destroy

    respond_to do |format|
      format.html { redirect_to project_url(:id => project_id, :page => 'options') }
      format.json { head :no_content }
    end
  end
end










