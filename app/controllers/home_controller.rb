class HomeController < ApplicationController
  before_action :authenticate_user!, only: :user  

    def index
      @posts = Post.all
      @users = User.all
    end

    def about
    end

    def user
      @user = User.find(params[:id])
    end   
  
end
