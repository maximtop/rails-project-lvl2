# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify, class_name: 'Post::Comment'
  # TODO: как модель отличит эти лайки от других, если создать другую папку вроде post?
  has_many :likes, dependent: :nullify, class_name: 'Post::Like'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
