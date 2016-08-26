class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
    @tasks = @project.tasks
    @discussions = @project.discussions
    @discussion = Discussion.new
    @comment = Comment.new
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

end
