Rails.application.routes.draw do
  devise_for :admins, :controllers => { :registrations => "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :pages, only: [:show]
  resources :cards, only: [:show, :update]
  resources :points, only: [:create, :update]

  get '/search', to: 'search#index'

  namespace :admin do
    resources :categories
    put '/reorder', to: 'categories#reorder'

    resources :content

    resources :pages do
      put '/reorder', to: 'pages#reorder'
    end
    resources :graphs do
      resources :lines, only: [:update]
      resources :points, only: [:update, :create, :destroy]
    end
    resources :external_graphs, only: [:index, :create, :update, :show, :destroy]
    resources :cards
    get '/manage_admins/', to: 'manage_admins#index'
    put '/manage_admins/:id', to: 'manage_admins#update'
    post '/manage_admins', to: 'manage_admins#create'
    delete '/manage_admins/:id', to: 'manage_admins#destroy'
  end
end
