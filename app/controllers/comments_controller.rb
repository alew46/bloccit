class CommentsController < ApplicationController

  before_action :require_sign_in
  before_action :authorize_user, only: [:destory]

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "There was a problem saving your comment."
      redirect_to [@post.topic, @post]
    end
  end

  def delete
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment deleted successfully."
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "There was a problem deleting the comment."
      redirect_to [@post.topic, @post]
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
