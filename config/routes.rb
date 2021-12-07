# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  resources :posts do
    resources :comments, controller: 'post_comments'
    resources :likes, controller: 'post_likes'
  end
end
