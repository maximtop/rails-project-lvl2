# frozen_string_literal: true

require 'test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create like' do
    user = users(:one)
    post = posts(:two)

    sign_in(user)

    post post_likes_url(post_id: post.id), params: { post_like: {} }

    assert_not_empty(post.likes.where(post_id: post, user_id: user))
  end

  test 'destroy' do
    user = users(:one)
    post = posts(:one)

    sign_in(user)

    like = post.likes.last

    delete post_like_url(post_id: post.id, id: like.id)

    assert_empty(post.likes.where(post_id: post, user_id: user))
  end
end
