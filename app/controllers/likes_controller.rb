class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    unless already_liked?
      @post.likes.create(user_id: current_user.id)
    end
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to posts_path }
    end
  end

  def destroy
    @like = @post.likes.find(params[:id])
    @like.destroy if @like.user_id == current_user.id
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to posts_path }
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    @post.likes.exists?(user_id: current_user.id)
  end
end
