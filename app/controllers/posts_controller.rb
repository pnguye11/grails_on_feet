class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show, :splash]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def myposts
    @posts = current_user.posts.order("created_at DESC")

  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Yaasss! It was posted!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notce: "Yaasss!! Updated!!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to index_path
  end

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
