class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def show
    @project = Project.find params[:id]
  end

  def edit
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new

  end

  def update
    @project = Project.find params[:id]
  end

  def destroy
    project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path
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
