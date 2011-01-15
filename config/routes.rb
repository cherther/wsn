Wsn::Application.routes.draw do
  
  resources :catalogs do
    collection do
      get 'upload'
    end
  end
  resources :contents do
    collection do
      get 'search'
      get 'results'
    end
  end
  #, :only => [:show, :edit, :update, :destroy]

  resources :sessions, :only => [:new, :create, :destroy]
  
  resources :users do
    collection do
      get 'invite'
    end
  end
  
  resources :lists do
    member do
        get 'add'
      end
  end

  get "lists/index"
  get "lists/new"
  get "lists/create"
  get "lists/show"
  get "lists/edit"
  get "lists/update"
  get "lists/destroy"

  get "users/index"
  get "users/new"
  get "users/create"
  get "users/show"
  get "users/edit"
  get "users/update"
  get "users/destroy"
  get "users/invite"
  
  get "catalogs/show"
  get "catalogs/edit"
  get "catalogs/update"
  get "catalogs/destroy"
  get "catalogs/upload"

  get "contents/show"
  get "contents/edit"
  get "contents/update"
  get "contents/destroy"

  get "pages/home"
  get "pages/contact"
  get "pages/help"
  get "pages/legal"
  get "pages/privacy"


   #match '/contents/:id', :to => 'contents#show', :as => :detail
   match '/download/:id', :to => 'contents#download', :as => :download
   match '/stream/:id', :to => 'contents#stream', :as => :stream

   match '/help', :to => 'pages#help'
   match '/legal', :to => 'pages#legal'
   match '/privacy', :to => 'pages#privacy'
   match '/contact', :to => 'pages#contact'
   match '/admin', :to => 'users#index'

   match '/register', :to => 'users#new'
   match '/login', :to => 'sessions#new'
   match '/logout', :to => 'sessions#destroy'
   #match '/profile/:id', :to => 'users#edit'
   match '/reset', :to => 'users#reset'

   match '/search', :to => 'contents#search'
  

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
  root :to => "pages#home" #, :as => :root

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
