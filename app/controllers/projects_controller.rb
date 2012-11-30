class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    projects = Project.scoped
    @active_projects = projects.where(:active => true)
    @completed_projects = projects.where(:active => false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
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

    if @phase.present?
      @posts = @posts.where(:phase => @phase).sort! { |a,b| b.updated_at <=> a.updated_at }
    end

    @post = Post.new
    @upload = params[:upload]
    @view_post = Post.find(params[:post_id]) unless params[:post_id].nil?

    if @page == 'overview'
      today = Time.now
      @posts_today = @posts.where(["created_at >= ? AND created_at <= ?", today.beginning_of_day, today.end_of_day]).sort! { |a,b| b.updated_at <=> a.updated_at }

      yesterday = today - 1.day
      @posts_yesterday = @posts.where(["updated_at >= ? AND updated_at <= ?", yesterday.beginning_of_day, yesterday.end_of_day])
    end

    if params[:current_phase].present?
       @project.update_attributes(:current_phase => params[:current_phase])
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
end
