# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create comment' do
    user = users(:one)
    post = posts(:one)

    sign_in(user)

    # TODO: do not let to create comment until signed in
    assert_difference('PostComment.count') do
      post post_post_comments_url(post_id: post.id), params: { post_comment: { content: 'comment content', parent_id: nil } }
    end
  end
end
