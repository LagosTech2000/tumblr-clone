class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # Ensure user is authenticated for comment actions
  before_action :set_post
  before_action :set_comment, only: [:destroy]

    
  def create         
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @post }
        format.turbo_stream
      end
    end
    
  end
  
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @post }
      format.turbo_stream
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: 'Post not found.'
  end

  def set_comment
   @comment = @post.comments.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to @post, alert: 'Comment not found.'
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body,:user_id,:post_id)
  end
end
