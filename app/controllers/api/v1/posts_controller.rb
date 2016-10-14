class Api::V1::TopicsController < Api::V1::BaseController
   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]

   def create
     post = Post.new(post_params)

     if post.valid?
       post.save!
       render json: post, status: 201
     else
       render json: { error: "Problem creating post", status: 400 }, status: 400
   end

   def update
     post = Post.find(params[:id])

     if post.update_attributes(post_params)
       render json: post { message: "Post updated successfully", status: 200 }, status: 200
     else
       render json: { error: "Problem updating post", status: 400 }, status: 400
     end
   end

   def destroy
     post = Post.find(params[:id])

     if post.destroy
       render json: { message: "Post deleted", status: 200 }, status: 200
     else
       render json: { error: "Problem deleting post", status: 400 }, status: 400
     end
   end

   private

   def post_params
     params.require(:post).permit(:title, :body, :topic, :user)
   end

end
