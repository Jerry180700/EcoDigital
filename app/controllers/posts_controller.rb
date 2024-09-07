class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]

  # List all posts
  def index
    @posts = Post.page(params[:page]).per(5)
  end

  # Show a post
  def show
  end

  # Create a new post with (form)
  def new
    @post = current_user.posts.build
  end

  # Create a new post (action)
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created successfully!'
    else
      render :new
    end
  end

  # Edit a post
  def edit
  end

  # Update a post
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully!'
    else
      render :edit
    end
  end

  # Delete a post
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post deleted successfully!' }
      format.json { head :no_content }
    end
    # redirect_to posts_url, notice: 'Post deleted successfully!'
  end

  private

  # Find a post by id
  def set_post
    @post = Post.find(params[:id])
  end

  # Let just some params
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
