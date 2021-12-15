# frozen_string_literal: true

class PostLikesController < ApplicationController
  before_action :check_user, :set_post

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

  def destroy
    @post.likes.delete(params[:id])
    redirect_to @post
  end

  private

  def check_user
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
