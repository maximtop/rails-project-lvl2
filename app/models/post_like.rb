# frozen_string_literal: true

class PostLike < ApplicationRecord
  # self.table_name = 'post_likes'
  belongs_to :user
  belongs_to :post
end
