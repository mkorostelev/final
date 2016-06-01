Rails.application.routes.draw do
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  resources :resumes, only: [:index, :new, :create, :destroy]
    root "resumes#index"

  resources :documents
  get 'download/:id' => 'documents#download', as: :download
  # get '/documents/:id/download', as: :document_download
  get 'admin' => 'admin#index'

    controller :sessions do
      get  'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end

  resources :users
  get 'store/index'

  resources :tasks
  resources :business_processes
  resources :route_points
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'store#index', as: 'store'


end
