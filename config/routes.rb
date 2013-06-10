App::Application.routes.draw do

  root :to => 'main#index'
  match 'all' => 'main#index'
  match 'register_user' => 'main#register_user'
  match 'register' => 'main#register'
  match 'log_in' => 'main#log_in'
  match 'log_out' => 'main#log_out'
  match 'log_in_user' => 'main#log_in_user'
  match 'post' => 'main#post'
  match 'post/:id' => 'main#post#:id'
  match 'user' => 'main#user'
  match 'user/:username' => 'main#user#username'
  match 'comment/:postid' => 'main#create_comment#postid'
  match 'create_post' => 'main#create_post'
  match 'create_post_tag' => 'main#create_post_tag'
  match 'delete_post/:postid' => 'main#delete_post#postid'
  match 'tag/:tag' => 'main#tag#tag'
  match 'tag/' => 'main#tag'
  match 'search_ajax/' => 'main#search_ajax'
  match 'rate_comment/:user/:id/:sign' => 'main#rate_comment#user#id#sign'
  match 'rate_post/:user/:id/:sign' => 'main#rate_post#user#id#sign'
  match 'rate_user/:user/:id/:sign' => 'main#rate_user#user#id#sign'
  #match '*path' => 'main#index'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
