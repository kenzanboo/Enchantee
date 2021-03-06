ActionController::Routing::Routes.draw do |map|
  map.resources :users, :has_many => [:interests, :categories]
  map.resource :user, :has_many => [:interests, :categories]
  map.resource :user_session
  
  map.location '/user/location', :controller => 'users', :action => 'location'
  map.update_location '/user/update_location', :controller => 'users', :action => 'update_location'
  
  map.resources :friendships
  
  map.nearby_list '/nearby/list', :controller => 'nearby', :action => 'list'
  map.nearby_map '/nearby/map', :controller => 'nearby', :action => 'map'
  map.nearby_location '/nearby/location', :controller => 'nearby', :action => 'location'
  
  map.welcome "welcome", :controller => "misc", :action => "welcome"
  map.signup "signup", :controller => "users", :action => "new"
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.homepage "home", :controller => 'nearby', :action => 'list'
  map.saved "saved", :controller => "users", :action => "saved"
  map.edit_profile "edit", :controller => "users", :action => "edit"
  
  map.root :controller => "nearby", :action => "list"

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
  
  # See how all your routes lay out with "rake routes"
  
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
