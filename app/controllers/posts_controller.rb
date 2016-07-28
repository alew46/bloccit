class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each do |post|
      if post.id % 5 == 0
        post.title = "SPAM"
      elsif post.id == 1
        post.title = "SPAM"
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end


end
