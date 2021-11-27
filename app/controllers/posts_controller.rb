# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def show; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
