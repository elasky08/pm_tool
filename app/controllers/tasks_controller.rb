class TasksController < ApplicationController
  def new
    @task = Task.new
    @project = Project.find params[:project_id]
  end

  def create
    @task = Task.new params.require(:task).permit(:title)
    @project = Project.find params[:project_id]
    @task.project = @project
    if @task.save
      redirect_to project_path(@project), notice: 'Successful'
    else
      render :new, alert: 'Unsuccessful'
      # redirect_to project_path(@project), alert: 'Unsuccessful'
    end
  end

  def show
    @task = Task.find params[:id]
    @project = Project.find params[:project_id]
    if params[:id]
      @task = Task.find params[:id]
      @task.status == false ? @task.status = true : @task.status = false
      @task.save
    end
    redirect_to project_path(@project)
  end

  def index
    @tasks = Task.all

  end

  def edit
    @task = Task.find params[:id]
    @project = Project.find params[:project_id]
  end

  def update
    @project = Project.find params[:project_id]
    task_params = params.require(:task).permit(:title)
    @task = Task.find params[:id]
    if @task.update task_params
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    project = Project.find params[:project_id]
    task = Task.find params[:id]
    task.destroy
    redirect_to project_path(project.id)
  end
end
