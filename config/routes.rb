Rails.application.routes.draw do
  get 'projects/index'
  root to: "projects#index"
  devise_for :users
end