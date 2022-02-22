Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users
  resources :users, only: [:index, :edit, :update] do
    resources :clients, only: [:index, :new, :create, :edit, :update] do
      resources :projects, only: [:new, :create, :edit, :update, :destroy] do
        resources :items, only: [:new, :create, :edit, :update, :destroy]

      end
    end
  end
end