class PostsController < ApplicationController

  attr_accessor :tags, :post_params

  before_action :load_post, only: [:edit, :destroy, :update]
  before_action :authenticate_user!, except: [:index]
  # before_action :load_params, only: [:update, :create]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save && @post.tag!(tags)
      flash[:success] = "Post created successfully."
    else
      flash[:error] = "Post creation failed."
    end

    redirect_to posts_path
  end

  def update
    if @post.update_attributes(post_params) && @post.tag!(tags)
      flash[:success] = "Post updated successfully"
    else
      flash[:error] = "Post update failed."
    end

    redirect_to posts_path
  end
  
  def destroy
    if @post.destroy
      flash[:success] = "Post destroyed successfully"
    else
      flash[:error] = "Post destruction failed."
    end

    redirect_to posts_path
  end

  private

  def authenticate_user!
    current_user.present?
  end

  def load_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def tags
    params.require(:associated_tags)
  end
end
