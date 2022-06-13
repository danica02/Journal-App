Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  
  resources :categories do
    resources :tasks
  end
  # get 'home/index'

  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
