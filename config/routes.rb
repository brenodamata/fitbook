Rails.application.routes.draw do

  get 'supplement_usages/new'
  get 'supplement_usages/create'

  resources :supplements do
    get 'add_stack', to: 'users#add_supplement_to_stack'
  end
  resources :supplement_sub_categories
  resources :supplement_categories

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    get 'supplements'
    get 'supplements/new', to: 'users#add_supplements', as: 'new_supplements'

    # get 'supplement_usages/:supplement_id/new', to: 'supplement_usages#new'
    # post 'supplement_usages', to: 'supplement_usages#create'

    # post 'supplements', supplements#create
    # get 'supplements'
    # POST   /supplements(.:format)
              # new_supplement GET    /supplements/new(.:format)                    supplements#new
    # DELETE /supplements/:id(.:format)                    supplements#destroy
  end

  resources :night_entries
  get '/night_entries/new/:date', to: "night_entries#new", as: 'new_night_entry_date'

  resources :day_entries
  get '/day_entries/new/:date', to: "day_entries#new", as: 'new_day_entry_date'

  get 'journal', to: "journals#show"

  # get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
