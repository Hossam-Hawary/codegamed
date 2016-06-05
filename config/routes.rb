Rails.application.routes.draw do
  devise_for :admins, path: 'admin_gamed', path_names: { sign_in: 'in', sign_out: 'logout', password: 'secret', registration: 'register', sign_up: 'let_me_be_admin' }

  get 'main_page/list_user_friends'
  get 'friendships/create'

  get 'friendships/update'

  get 'friendships/destroy'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :levels do
    collection do
      post 'show_user_levels', :action => 'show_user_levels'
    end
  end

  resources :missions do
    collection do
      post 'show_user_missions', :action => 'show_user_missions'
      post 'compile_user_code', :action => 'compile_user_code'

    end
  end

  # post '/levels/show_user_levels' => 'levels#show_user_levels'
  # post '/levels/show_user_missions' => 'levels#show_user_missions'

  resources :badges
  #resources :missions
  resources :test_cases
  root 'main_page#index'

  resources :friendships
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
