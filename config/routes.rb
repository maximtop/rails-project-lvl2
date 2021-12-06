# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  resources :posts do
    resources :post_comments
    resources :post_likes
  end
end
