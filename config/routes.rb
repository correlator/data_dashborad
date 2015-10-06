Rails.application.routes.draw do
  devise_for :admins, :controllers => { :registrations => "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
    resources :pages, only: [:show]

  namespace :admin do
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :pages, only: [:index, :create, :update, :destroy]
    resources :graphs, only: [:index, :create, :update, :show, :destroy]
    resources :external_graphs, only: [:index, :create, :update, :show, :destroy]
    resources :points, only: [:update, :create, :destroy]
    get '/manage_admins/', to: 'manage_admins#index'
    put '/manage_admins/:id', to: 'manage_admins#update'
    post '/manage_admins', to: 'manage_admins#create'
    delete '/manage_admins/:id', to: 'manage_admins#destroy'
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
