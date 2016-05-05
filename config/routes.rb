Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  get '/listings/mylistings' => 'listings#listing_index', as: 'listing_index'
  get '/listings' => 'listings#master_listing', as: 'master_listing'
  get '/listings/new' => 'listings#new', as: 'new_listing'
  post '/listings' => 'listings#create'
  get 'listings/:id' => 'listings#show', as: 'show_listing'
  get 'listings/:id/edit' => 'listings#edit', as: 'edit_listing'
  patch 'listings/:id/edit' => 'listings#update'
  delete 'listings/:id' => 'listings#destroy', as: 'destroy_listing'
  get '/index' => 'home#index', as: 'index'
  get '/profile' => 'profile#profile', as: 'profile'
  get '/profile/edit' => 'profile#edit', as: 'edit_profile'
  patch '/profile' => 'profile#update'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#login'

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
