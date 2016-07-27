class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def censor
    @posts = Post.all
    @posts.each do |post|
      if post.id % 5 == 0
        Post.title = "SPAM"
      elsif post.id == 1
        Post.title = "SPAM"
      end
    end
  end

end
