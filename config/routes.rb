Fakebook::Application.routes.draw do
  root :to => 'home#index'
  get "home/index"

  authenticated :user do
	  resources :posts do
	  	resources :comments
	  	resources :post_likes do
		  	get :custom_create, 	on: :collection
		  	get	:custom_destroy, 	on: :member
		  end
	  end
	end
	
	resources :comments do
		resources :comment_likes do
	  	get :custom_create, 	on: :collection
	  	get	:custom_destroy, 	on: :member
	  end
	end
  
	resources :eventos do
		post :pesquisa, on: :collection
		resources :participacao_eventos
		member do
		  get :evento, :profile
		end
		match '/participar', :controller => 'eventos', :action => "participar"
	end
  
	resources :eventos do
		post :pesquisa, on: :collection
		resources :participacao_eventos
		match '/participacao_eventos/new', :controller => 'participacao_eventos', :action => 'new'
		member do
		  get :evento, :profile
		end
	end
  resources :participacao_eventos
  match '/eventos/index', :controller => 'eventos', :action => "index"
  
  
  
  #resources :eventos do get :show2, on: :collection end
    #match'/eventos/show2', :controller => 'eventos', :action => 'show2'
  #match "/eventos/show2/:id" => "eventos#show2"
  #match '/eventos/show2/:id', :controller => 'eventos', :action => "show2"
  #get "eventos/show2/:id"
#devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #Aninhando profiles dentro do user
  devise_for :users, :controllers => { :registrations => "registrations",:omniauth_callbacks => "users/omniauth_callbacks" } do
    resources :profiles  do
      member do
        get :following, :followers
        get :mural
      end
     
    end
     resources :relationships
  end
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
  match ':controller(/:action(/:id))(.:format)'
end
