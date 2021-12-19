# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create comment' do
    user = users(:one)
    post = posts(:one)

    sign_in(user)

    assert_difference('PostComment.count') do
      post post_comments_url(post_id: post.id), params: { post_comment: { content: Faker::Lorem.sentence, parent_id: nil } }
    end
  end
end
