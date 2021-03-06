FoodierecsTwo::Application.routes.draw do
  get "saved_places/new"

  get "saved_places/create"

  get "saved_places/update"

  get "saved_places/edit"

  get "saved_places/destroy"

  get "saved_places/index"

  get "saved_places/show"

  #get "sessions/new"
  get "pages/home"
  #get "pages/index"

  resources :restaurants

  resources :users

  resources :opinions

  resources :mappings

  resources :nominations

  resources :feeds
  
  resources :saved_places
  
  #resources :pages
  
  #root :to => 'pages#index'
  root :to => 'pages#home'
  
  #match '/auth/:provider/callback', :to => 'sessions#create'
  match 'session/new/:id' => 'sessions#new'
  match 'session/destroy' => 'sessions#destroy'
  
  match '/main' => 'pages#main'
  match '/becomeafoodie' => 'pages#becomeafoodie'
  match '/restaurant' => 'pages#restaurant'
  match '/recommendations' => 'pages#recommendations'
  
  match '/restaurants/findid/:formatted_name' => 'restaurants#findId'
  match '/restaurants/search' => 'restaurants#search'
  match '/opinion/deleteid/:formatted_name/:user_id' => 'opinions#deleteid'
  #temporary!
  match '/restaurant/createindex' => 'restaurants#createindex'
  
  match '/users/exists/:username' => 'users#exists'
  
  match ':id' => 'users#show'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
