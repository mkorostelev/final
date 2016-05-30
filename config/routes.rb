Rails.application.routes.draw do
  get 'store/index'

  resources :tasks
  resources :business_processes
  resources :route_points
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'store#index', as: 'store'
end
