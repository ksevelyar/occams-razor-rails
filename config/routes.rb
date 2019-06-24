# frozen_string_literal: true

Rails.application.routes.draw do
  scope defaults: { format: :json } do
    resources :posts
    resource :session, only: %i[create update destroy]
  end
end
