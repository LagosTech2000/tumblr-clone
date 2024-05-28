class HomeController < ApplicationController
  
    def index
      @posts = Post.all
      @users = User.all.sample(3)
    end

    def about
    end

    def user
      @user = User.find(params[:id])
    end   
  
end
