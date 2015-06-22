Rails.application.routes.draw do



  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }



  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:sessions, :registrations]
  #   as :user do
  #   get    'signup'  => 'registrations#new',       :as => :new_user_registration
  #   post   'signup'  => 'registrations#create',    :as => :user_registration
  #   get    'signin'  => 'devise/sessions#new',     :as => :new_user_session
  #   post   'signin'  => 'devise/sessions#create',  :as => :user_session
  #   delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # devise_for :users

  # the routes are messed up, devise for users is the most general, but w/o omni auth instructions, and the small devise for users line is too small, to go step by step, i should try out just the top one, nubmer 1, then number 2, then 3. i think #2 is right,

  resources :friendships


  #basically I'm enabling users to be lazier by not having to use the users/sign_up route, just sign_up or sign_in
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_up", to: "devise/registrations#new"
  end

  root 'posts#index'

  get 'users' => 'users#index'
  get 'users/:id' => 'users#show', :as => :user

  resources :posts

  resources :likes, only: [:create, :destroy]

  resources :comments

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
