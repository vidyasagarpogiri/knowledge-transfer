Rails.application.routes.draw do
 resources :users
    #devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root :to => 'home#index'
    
    resources :projects
    
    resources :questions do 
      resources :answers
    end
    
    resources :articles
    resources :code_snippets
    
    resources :categories do 
      member do 
        get 'show_articles'
        get 'show_blogs'
        get 'show_code_snippets'
        get 'show_questions'
      end
    end
    
    get '/tags/code_snippets' => 'code_snippets#tags'
    get '/tags/questions' => 'questions#tags'
    get '/tags/articles' => 'articles#tags'
    get '/tags/blogs' => 'blogs#tags'
   
    resources :comments
    resources :blogs
     resources :users, except: [:show, :destroy] do
      member do
        get 'user_articles'
        get 'user_blogs'
        get 'user_code_snippets'
        get 'user_questions'
        get 'profile'
        get 'subscribe'
      end
    end
   
    
     #get 'users/users_index'

    mount Bootsy::Engine => '/bootsy', as: 'bootsy'
    
    
    #for devise
    devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
    controllers: {omniauth_callbacks: "omniauth_callbacks"}
    
    
    devise_scope :user do
      get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
      get '/users/auth/:provider/callback' => 'omniauth_callbacks#all'
    end
    
    get 'search' => 'search#search_engine'
    get 'search/global_search_engine' => 'search#global_search_engine'
    get 'search/users_search' => 'search#users_search'
    get 'search/advance_search' => 'search#advance_search'
    
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
