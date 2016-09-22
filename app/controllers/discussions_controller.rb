class DiscussionsController < ApplicationController
  before_action :authorize!, only: [:destroy, :update, :edit]
  before_action :load_discussion_and_authorize!, only: [:destroy, :update, :edit]


  def create
    @project          = Project.find params[:project_id]
    # @discussion       = @project.discussions.new params.require(:discussion).permit(:description, :title)

    @discussion = Discussion.new params.require(:discussion).permit(:description, :title)
    @discussion.project_id = @project.id

    @tasks = @project.tasks
    @discussions = @project.discussions

    if @discussion.save
      redirect_to project_path(@project), notice: "discussion created!"
    else
      render "/projects/show", notice: "Error"
    end
  end

  def show
    @discussion = Discussion.find params[:id]
    @comments = @discussion.comments
    @comment = Comment.new
  end

  def destroy
    @project = Project.find params[:project_id]
    # @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to project_path(@project), notice: "Discussion deleted"
  end

  def edit
    @project = Project.find params[:project_id]
    # @discussion = Discussion.find params[:id]
  end

  def update
    # @discussion = Discussion.find params[:id]
    if @discussion.update discussion_params
      redirect_to project_path(@discussion.project_id)
    else
      render :edit
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit([:title, :description])
  end

  def load_discussion_and_authorize!
    @discussion = Discussion.find params[:id]
    redirect_to root_path, alert: "access denied" unless @discussion.user == current_user
  end
end
