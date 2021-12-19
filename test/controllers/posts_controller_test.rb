# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should create post' do
    user = users(:one)
    post_category = post_categories(:one)

    sign_in user

    assert_difference('Post.count') do
      post posts_url, params: { post: { title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, post_category_id: post_category.id } }
    end

    assert_redirected_to root_url
  end
end
