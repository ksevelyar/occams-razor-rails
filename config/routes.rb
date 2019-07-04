# frozen_string_literal: true

Rails.application.routes.draw do
  scope defaults: { format: :json } do
    resources :posts, only: %i[index show]

    namespace :admin do
      resource :session, only: %i[create update destroy]
      resources :posts, only: %i[create update destroy]
    end
  end
end
