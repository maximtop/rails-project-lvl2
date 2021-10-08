# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :set_post

    def create
      @comment = @post.comments.build

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
      params.require(:post_comment).permit(:body)
    end
  end
end
