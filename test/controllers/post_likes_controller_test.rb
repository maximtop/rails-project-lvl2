# frozen_string_literal: true

require 'test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create like' do
    user = users(:one)
    post = posts(:two)

    sign_in(user)

    likes_count = post.likes.count

    post post_likes_url(post_id: post.id), params: { post_like: {} }
    assert_equal(post.likes.count, likes_count + 1)

    post post_likes_url(post_id: post.id), params: { post_like: {} }
    assert_equal(post.likes.count, likes_count)
  end

  test 'should delete likes' do
    user = users(:one)
    post = posts(:one)

    sign_in(user)

    likes_count = post.likes.count

    post post_likes_url(post_id: post.id)
    assert_equal(post.likes.count, likes_count - 1)
  end

  test 'destroy' do
    user = users(:one)
    post = posts(:one)

    sign_in(user)

    likes_count = post.likes.count
    like = post.likes.last

    delete post_like_url(post_id: post.id, id: like.id)
    assert_equal(post.likes.count, likes_count - 1)
  end
end
