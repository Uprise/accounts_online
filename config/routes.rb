AccountsOnline::Application.routes.draw do
  # get 'application_forms/second_step' => 'application_forms#optional_info', :as => 'second_step'
  # post 'application_forms/third_step' => 'application_forms#download', :as => 'third_step'
  # post 'application_forms/update_notes/:id' => 'application_forms#update_notes'
  # post 'application_forms/update_status/:id' => 'application_forms#update_status'
  
  
  resources :users, :only => [:show] do
    resources :entities, :only => [:show, :create, :new, :edit, :update] do
      resources :application_forms do
        match 'view' => 'application_forms#view'
        match 'update_notes' => 'application_forms#update_notes'
        match 'update_status' => 'application_forms#update_status'
      end
      get 'change_banks' => 'entities#change_banks'
      get 'pricing' => 'entities#pricing'
      post 'pricing' => 'entities#set_account'
    end
  end

  get "pdfs/:id(.:format)" => 'pdfs#show'
  
  get "admin/export"
  get "admin/edit/:id" => 'admin#edit', :as => 'admin_edit'
  get "admin" => 'admin#home'

  get "pages/home"

  devise_for :users, :path => 'accounts'
  root :to => "pages#home"
  
  get 'pdf/:id(.:format)' => 'pdf#show'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
