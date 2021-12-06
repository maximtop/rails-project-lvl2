# frozen_string_literal: true

class PostLikesController < ApplicationController
  before_action :set_post

  def create
    likes = @post.likes.where(user_id: current_user.id)

    if likes.count.zero?
      @like = @post.likes.build
      @like.user_id = current_user.id
      @like.save
    else
      likes.each(&:delete)
    end

    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_like)
  end
end
