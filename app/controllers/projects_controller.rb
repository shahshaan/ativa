class ProjectsController < ApplicationController

  before_filter :require_login

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    projects = Project.scoped
    @active_projects = projects.where(:active => true).sort! { |a,b| b.post_last_updated <=> a.post_last_updated }
    @completed_projects = projects.where(:active => false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @phase = params[:phase]
    @upload = "as"

    @project = Project.find(params[:id])
    @phases = ['onboarding','creative','design','development','implementation']

    @page = params[:page]
    @page = 'phase' unless @page.present?

    if params[:phase].present?
      @phase = params[:phase]
    elsif params[:current_phase].present?
      @phase = params[:current_phase]
    else
      @phase = @project.current_phase
    end


    @posts = Post.where(:project_id => @project.id)

    if @page != 'overview'
      @posts = @posts.where(:phase => @phase).sort! { |a,b| b.updated_at <=> a.updated_at }
    end

    @upload = params[:upload]

    if @upload == 'post'
      @post = Post.new
    elsif @upload == 'subpost'
      @subpost = Subpost.new
      @post = Post.find(params[:post_id])
    end
    

    # @subpost_upload = params[:subpost_upload]
    # if @subpost_upload == "true"
    #   @subpost = Subpost.new
    #   @post_id = Post.find(params[:post_id]).id
    # end
    
    

    if params[:current_phase].present? && current_user.admin?
       @project.update_attributes(:current_phase => params[:current_phase])
    end

    if @page == 'overview'
      today = Time.now
      @posts_today = @posts.where(["created_at >= ? AND created_at <= ?", today.beginning_of_day, today.end_of_day]).sort! { |a,b| b.updated_at <=> a.updated_at }

      yesterday = today - 1.day
      @posts_yesterday = @posts.where(["updated_at >= ? AND updated_at <= ?", yesterday.beginning_of_day, yesterday.end_of_day]).sort! { |a,b| b.updated_at <=> a.updated_at }

      older_than_yesterday = yesterday - 1.day
      @posts_older_than_yesterday = @posts.where(["updated_at <= ?", older_than_yesterday.end_of_day]).sort! { |a,b| b.updated_at <=> a.updated_at }
    end

    if @page == 'options'
      @clients = @project.clients
      @add_client = params[:add_client]
      @client = Client.new
      @gmail = ENV['PSD_GMAIL_EMAIL']
    end

    if @page == 'post_view'
      @view_post = Post.find(params[:post_id])
      @note = Note.new
      @notes = Note.where(:post_id => @view_post.id)
      @attachment = Attachment.new
      @attachment_partial = params[:attachment_partial]
      if @attachment_partial == 'view'
        @attachment = Attachment.find(params[:attachment_id])
      end
    end

    if @page == 'subpost_view'
      @subpost = Subpost.find(params[:subpost_id])
    end



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    @phases = ['onboarding','creative','design','development','implementation']

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit

  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def status
    @project = Project.find(params[:id])

    @project.status_change(params[:active])
    

    @status = params[:active]
    
    redirect_to project_url(:id => @project.id, :page => 'options', :status => @status)

  end
end
