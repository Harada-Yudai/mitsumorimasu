Rails.application.routes.draw do
  get 'projects/index'
  root to: "projects#index"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :users, only: [:show, :edit, :update]
end