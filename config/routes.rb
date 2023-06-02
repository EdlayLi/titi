# frozen_string_literal: true

Rails.application.routes.draw do
  root "searches#show"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :tickets

  resource :search, only: [:new, :show, :edit] do
    collection do
      get :result
    end
  end

  namespace :admin do
    root "welcome#index"
    resources :routes
    resources :tickets
    resources :users

    resources :trains do
      resources :carriages, shallow: true
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
  end
end
