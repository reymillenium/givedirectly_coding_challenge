# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # resources :books
      # resources :requests
      post '/request', to: 'requests#request_book_data'
      get '/request', to: 'requests#index'
      get '/request/:id', to: 'requests#show'
      delete '/request/:id', to: 'requests#destroy'
    end
  end

end
