class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_user, except: %i[index  show ]
  def index
    @posts=Post.all
    render json: Post.all
  end

  def show 
    render json: Post.all
  end

  def new
    @post=Post.new()
  end

  def create
    @post=Post.create(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors
    end

  end


  def edit
  end

  def update
    authorize @post

  end
  

  def destroy
  end

  
  private

  def authorize_user
    post = @post || Post
    authorize post 
  end

  def post_params
    params.require(:posts).permit(:title,:body,:published)
  end

  def set_post
    @post=Post.find(params[:id])
  end
end
