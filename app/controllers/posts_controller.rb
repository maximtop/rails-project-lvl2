# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, :set_like, only: :show

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
      redirect_to root_url, notice: I18n.t('post_created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_like
    @like = @post.likes.find_by(user_id: current_user)
  end

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
