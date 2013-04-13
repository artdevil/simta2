Simta2::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'pages#index'
  resources :pages do
    get :user_profile, :on => :member
  end
  resources :notifications do
    get :getnotification, :on => :collection
  end
  resources :topics do
    get :tag_topic, :on => :member
    get :approve, :on => :member
    get :user, :on => :collection
  end
  resources :messages do
    get :reply, :on => :member
    get :user, :on => :collection
  end
  resources :proposals do
    get :todo, :on => :member
    post :comment, :on => :collection
    get :bimbingan_proposal, :on => :member
    get :data_mahasiswa, :on => :collection
    get :update_progress, :on => :member
    get :todo_finish, :on => :member
    get :dosen_proposal, :on => :collection
    put :update_dosen
  end
  devise_for :users
  
  ActiveAdmin.routes(self) do
    root :to => "admin/dashboard#index"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config

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
