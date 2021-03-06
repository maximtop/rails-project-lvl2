# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :check_user, :set_post

  def create
    @like = @post.likes.build
    @like.user_id = current_user.id
    @like.save

    redirect_to @post
  end

  def destroy
    @post.likes.delete(params[:id])
    redirect_to @post
  end

  private

  def check_user
    return if user_signed_in?

    redirect_to user_session_path
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
