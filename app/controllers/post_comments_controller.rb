# frozen_string_literal: true

class PostCommentsController < ApplicationController
  before_action :check_user, :set_post

  def create
    @comment = @post.comments.build(comment_params)
    # FIXME: handle cases when user is undefined
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post
    end
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

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
