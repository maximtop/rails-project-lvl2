# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create comment' do
    user = users(:one)
    post = posts(:one)

    sign_in(user)

    # TODO: do not let to create comment until signed in
    assert_difference('Posts::Comment.count') do
      post post_post_post_comments_url(post_id: post.id), params: { posts_comment: { content: 'comment content', parent_id: nil } }
    end
  end
end
