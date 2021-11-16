# frozen_string_literal: true

class Post
  class Comment < ApplicationRecord
    has_ancestry

    belongs_to :post
    belongs_to :user
  end
end
