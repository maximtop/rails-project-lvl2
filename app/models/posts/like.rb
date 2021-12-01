# frozen_string_literal: true

module Posts
  class Like < ApplicationRecord
    self.table_name = 'post_likes'
    belongs_to :user
    belongs_to :post
  end
end
