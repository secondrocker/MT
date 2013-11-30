class PostsController < ApplicationController
  respond_to :json

  before_action :get_post ,only:[:show,:update,:destroy]
  
  skip_before_filter :verify_authenticity_token, :only => [:create, :update,:destroy]
  def index
    respond_with Post.all
  end
  
  def show
    respond_with @post
  end
  
  def update
    respond_with @post.update(post_params)
  end
  
  def create
    respond_with Post.create(post_params)
  end
  
  def destroy
    respond_with @post.destroy
  end
  
  private
    def get_post
      @post=Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title,:winner)
    end
end
