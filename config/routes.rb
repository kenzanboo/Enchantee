ActionController::Routing::Routes.draw do |map|
  map.resources :interests, :has_many => :users, :has_one => :category

  map.resources :categories, :has_many => [ :interests, :users]

  map.resources :users, :has_many => [ :interests, :categories ]
  map.signup "signup", :controller => "users", :action => "new"
  map.user_interests_list 'users/:user_id/interests_list/', :controller => "users", :action => "interests"
  
  map.resource :user_session
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.welcome "welcome", :controller => "misc", :action => "welcome"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "placeholder", :action => "index"

  # See how all your routes lay out with "rake routes"
  map.nearby_list '/nearby/list', :controller => 'nearby', :action => 'list'
  map.nearby_map '/nearby/map', :controller => 'nearby', :action => 'map'

  map.update_location 'users/:user_id/update_location', :controller => 'users', :action => 'update_location'
  
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
