Rails.application.routes.draw do

  post '/rooms' => 'rooms#create'

  post '/categories' => 'categories#create'

  get '/items' => 'items#index', as: :items
  post '/items' => 'items#create'
  patch '/items/:id' => 'items#update', as: :item
  delete '/items/:id' => 'items#destroy', as: :delete_item
  get '/items/refresh_item/:house_id' => 'items#refresh_item', as: :refresh_item
  get '/items/:id' => 'items#show', as: :show_item
  get '/house_items' => 'items#house_items', as: :house_items

  get '/inventory' => 'pages#inventory', as: :inventory
  get '/improvements' => 'pages#improvements', as: :improvements
  get '/settings' => 'pages#settings', as: :settings

  resources :houses

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  authenticated :user do
    root to: "pages#inventory", as: :user_root
  end
  root to: 'pages#home'

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
