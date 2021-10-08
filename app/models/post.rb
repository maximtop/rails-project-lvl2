# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :user

  has_many :comments, dependent: :destroy
end
