Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get "tasks", to: "tasks#index"
  
  resources :categories do
    resources :tasks, except: [:index]
  end

end
