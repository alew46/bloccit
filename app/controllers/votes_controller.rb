class VotesController < ApplicationController

  before_action :require_sign_in

  def up_vote
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    update_vote(-1)
    redirect_to :back
  end

private

  def update_vote(vote_value)
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first

    if @vote
      @vote.update_attribute(:value, vote_value)
    else
      @vote = current_user.votes.create(value: vote_value, post: @post)
    end

  end

end
