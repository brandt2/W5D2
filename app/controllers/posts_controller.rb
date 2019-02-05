class PostsController < ApplicationController
  before_action :require_login 

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @post.sub_id = params[:sub_id]
    if @post.save 
      redirect_to sub_url(@post.sub_id)
    else 
      flash.now[:errors] = @post.errors.full_messages 
      render :new 
    end
  end

  # def edit
  #   @post = current_user.posts.find(params[:id])
  # end

  # def update
  #   @post = current_user.posts.find(params[:id])
  #   if @post.update(post_params)
  #     redirect_to 
  #   else 
  #   end
  # end

  def show
    @post = Post.find(params[:id])
  end

  # def destroy
  # end

  def post_params 
    params.require(:post).permit(:title, :url, :content, :sub_id => [])
  end 
end
