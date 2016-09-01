class ProjectsController < ApplicationController
  before_action :authenticate_user!
  PROJECTS_PER_PAGE = 7

  def index
    @projects2 = Project.search(params[:search_term])
    @projects = @projects2.order(created_at: :desc).
                           page(params[:page]).
                           per(PROJECTS_PER_PAGE)
  end

  def show
    @project = Project.find params[:id]
    @projects2 = Project.search(params[:search_term])
    @projects = @projects2.order(created_at: :desc).
                           page(params[:page]).
                           per(PROJECTS_PER_PAGE)
    @tasks = @project.tasks.order(:title)
    @discussions = @project.discussions

    @discussion = Discussion.new
    # @discussion = @project.discussions.new

    # if params[:id]
    #   @task = @project.tasks
    #   @task.status == false ? @task.status = true : @task.status = false
    #   @task.save
    # end

    # @comment = Comment.new
  end

  def edit
    @task = Task.find params[:id]
    @project = Project.find params[:id]
  end

  def new
    @task = Task.new
    @project = Project.new
  end

  def update
    @project = Project.find params[:id]
    if @project.update project_params
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to project_path
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to project_path(@project), notice: "Project created successfully"
    else
      flash[:alert] = "Please fix errors below before saving"
      render :new
    end
  end

  def project_params
    params.require(:project).permit([:title, :description])
  end

  def search
    if params[:search_term]
      query = "%#{params[:search_term]}%"
      @projects = Project.where(
      "title ILIKE :search_term OR description ILIKE :search_term",
      {search_term: query}
      )
    else
      @projects = Project.all
    end
      render :index
  end

end
