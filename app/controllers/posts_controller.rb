class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  # def show
  # end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      flash[:success] = "Post created successfully."
    else
      flash[:error] = "Post creation failed."
    end

    redirect_to posts_path
  end

  def update
    if @post.update_attributes(post_params)
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

  def load_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
