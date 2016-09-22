class CommentsController < ApplicationController
  before_action :authorize!, only: [:destroy, :update, :edit]
  before_action :load_comment_and_authorize!, only: [:destroy, :update, :edit]

  def show
  end

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    discussion_id = params[:discussion_id]
    discussion = Discussion.find discussion_id
    if discussion.comments.create find_params
      redirect_to project_discussion_path(discussion.project, discussion)
    else
      flash[:alert] = "fix errors"
      redirect_to project_path(discussion.project_id)
    end
  end

  def edit
    @discussion = Discussion.find params[:discussion_id]
    # @comment = Comment.find params[:id]
  end

  def update
    @discussion = Discussion.find params[:discussion_id]
    # @comment = Comment.find params[:id]
    if @comment.update params.require(:comment).permit([:body])
      redirect_to project_discussion_path(@discussion.project_id, @discussion)
    else
      render :edit
    end
  end

  def destroy
    @discussion = Discussion.find params[:discussion_id]
    # @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to project_discussion_path(@discussion.project, @discussion), notice: "comment deleted"
  end

  private

  def find_params
    params.require(:comment).permit(:body)
  end

  def load_comment_and_authorize!
    @comment = Comment.find params[:id]
    redirect_to root_path, alert: "access denied" unless @comment.user == current_user
  end
end
