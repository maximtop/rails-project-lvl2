# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :creator, class_name: 'User'

  has_many :post_comments, dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
end
