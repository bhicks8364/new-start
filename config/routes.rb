Rails.application.routes.draw do
  root 'dashboard#home'
  get  'sign_in' => 'dashboard#sign_in_page'
  resources :agencies do
    resources :admins
  end
  devise_for :admins, controllers: {
        
        registrations: 'admins/registrations'
      }
  
  
  
  
  
  
  resources :skills
  
  resources :events
  
  get  'dashboard' => 'admin/dashboard#company_view'
  
  
  get  'agency_access' => 'admin/dashboard#agency_view'
  
  devise_for :users, controllers: {
        
        registrations: 'users/registrations'
      }

  
  

  namespace :admin do
    resources :companies do
      resources :timesheets
      resources :orders
      
    end
    resources :shifts
    resources :timesheets do
      collection do
        get 'past'
      end
      
    end
    resources :employees do
      resources :jobs
      resources :skills
    end
    resources :orders do
      resources :skills
      resources :jobs
    end
    get  'payroll' => 'dashboard#payroll'
    get  'dashboard' => 'dashboard#company_view'
    get  'owner' => 'dashboard#owner'
  
    get  'agency_access' => 'dashboard#agency_view'
    
    
    resources :jobs, shallow: true do

      resources :timesheets, shallow: true do
        collection do
          get 'past'
        end
        member do
          patch 'approve'
        end
      end

      member do
        patch 'clock_in'
        patch 'clock_out'
      end
    end
    
    
    resources :shifts do
      member do
        patch 'clock_out'
      end
    end
  end

  get 'orders' => 'orders#all'
  get 'archived_jobs' => 'jobs#archived'
  
  
  resources :users do
    collection do
      post :import
    end
    member do
      patch :grant_editing
    end
  end

  get  'timeclock', to: 'employee/dashboard#employee_view'
  get  'home', to: 'employee/dashboard#home'
  
  resources :timesheets, path: "employee/timesheets", module: "employee"
  resources :jobs, path: "employee/jobs", module: "employee" do
    member do
      patch 'clock_in'
      patch 'clock_out'
    end
  end
    

  resources :admins do
    member do
      post :mention
      post :follow
      
    end
  end

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

  # Example of regular route:


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
