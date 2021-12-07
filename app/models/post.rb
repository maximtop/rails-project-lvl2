# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
end
