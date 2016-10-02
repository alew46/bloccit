class FavoriteMailer < ApplicationMailer
  default from: "alew46@yahoo.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example"
    headers["References"] = "post/#{post.id}@your-app-name.example"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post)
    headers["Message-ID"] = "<post/#{post.id}@your-app-name.example"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example"
    headers["References"] = "post/#{post.id}@your-app-name.example"

    @user = user
    @post = post

    mail(to: user.email, subject: "Your new post added to favorites")
  end

end
