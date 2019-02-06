class CommentsController < ApplicationController
  before_action :require_login

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id] 
    if @comment.save 
      redirect_to post_url(@comment.post_id)
    else 
      flash.now[:errors] = @comment.errors.full_messages
      render :new 
    end 
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
