# frozen_string_literal: true

class Post
  class CommentsController < ApplicationController
    before_action :set_post

    def create
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        redirect_to @post
      end
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:post_comment).permit(:content)
    end
  end
end

