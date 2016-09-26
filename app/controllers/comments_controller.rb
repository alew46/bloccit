class CommentsController < ApplicationController

  before_action :require_sign_in
  before_action :authorize_user, only: [:destory]

  def create
    if params[:post_id]
      @parent = Post.find(params[:post_id])
    elsif params[:topic_id]
      @parent = Topic.find(params[:topic_id])
    end

    @comment = @parent.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      if @parent.is_a?(Post)
        flash[:notice] = 'Comment saved successfully'
        redirect_to [@parent.topic, @parent]
      elsif @parent.is_a?(Topic)
        flash[:notice] = 'Comment saved successfully'
        redirect_to @parent
      end
    end
  end

  def delete
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Comment successfully deleted."
      redirect_to :back
    else
      flash[:alert] = "There was a problem saving your comment."
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || (current_user.admin?)
      flash[:alert] = "You must be an admin to do that."
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
