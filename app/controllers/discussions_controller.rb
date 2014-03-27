class DiscussionsController < ApplicationController
  before_action :set_project
  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = @project.discussions.new(discussion_params)
    @discussion.user = current_user
    if @discussion.save
      redirect_to @project
    else
      render 'form'
    end
  end

  def show
    @discussion = set_discussion
    @comment = Comment.new
    @comments = @discussion.comments
  end

  def destroy
    @discussion = set_discussion
    if (current_user == @discussion.user)
      @discussion.delete
    else
    flash[:notice] = "Only discussion authors may delete them."
    redirect_to project_discussion_path
    end

  end


  private

  def set_discussion
    Discussion.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def discussion_params
    params.require(:discussion).permit(:title, :body, :projects_id, :user_id)
  end

end
