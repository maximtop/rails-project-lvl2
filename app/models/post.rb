# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :user

  has_many :comments, dependent: :destroy, class_name: 'Posts::Comment'
  has_many :likes, dependent: :destroy, class_name: 'Posts::Like'
end
