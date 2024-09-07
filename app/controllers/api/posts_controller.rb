# class Api::PostsController
# Controller to handle actions related to posts within the 'Api' namespace
# This controller allows you to perform CRUD actions through a JSON API.
class Api::PostsController < ApplicationController
  # The 'set_post' and 'authenticate_user!' methods will be executed before the specified actions.
  before_action :set_post, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # List all posts in JSON format
  def index
    @posts = Post.all
    render json: @posts
  end

  # Show a post in JSON format
  def show
    render json: @post
  end

  # Create a new post
  def create
    # Associate the new post with the authenticated user
    @post = current_user.posts.build(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # Update a post
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # Delete a post
  def destroy
    @post.destroy
    head :no_content
  end

  private

  # Find a post by id
  def set_post
    @post = Post.find(params[:id])
  end

  # Prevents the user from sending other unauthorized data.
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
