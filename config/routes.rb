# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # resources :books
      post '/request', to: 'books#request_book_data'
      get '/request', to: 'books#index'
      get '/request/:id', to: 'books#show'
      delete '/request/:id', to: 'books#destroy'
    end
  end

end
