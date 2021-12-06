# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :likes, dependent: :nullify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
