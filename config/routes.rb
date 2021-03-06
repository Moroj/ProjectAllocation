ProjectAllocation::Application.routes.draw do
  
  namespace :admin do
     resources :students 
     resources :academics
     resources :departments do
       resources :courses
     end
   end
   
   devise_for :admins, :skip => [:registrations]
       as :admin do 
         get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'    
         put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
       end

     devise_for :academics, :skip => [:registrations]
       as :academic do 
         get 'academics/edit' => 'devise/registrations#edit', :as => 'edit_academic_registration'    
         put 'academics' => 'devise/registrations#update', :as => 'academic_registration'
       end

     devise_for :students, :skip => [:registrations]
       as :student do 
         get 'students/edit' => 'devise/registrations#edit', :as => 'edit_student_registration'    
         put 'students' => 'devise/registrations#update', :as => 'student_registration'
     end
  
   resources :allocs 
   
   #match 'csv' => 'allocs#export', :as => :csv
   
   match '/result', to: 'allocs#result'
   
   resources :projects
   
   resources :choices do
     collection { post :sort}
   end

   resources :aprofiles

   resources :sprofiles 

   resources :admin

   root to: 'static_pages#home'

   match '/contact', to: 'static_pages#contact'

   match '/help', to: 'static_pages#help'

   match '/update_courses', to:  'sprofiles#update_courses'

   match '/update_academics', to: 'projects#update_academics'

   match '/project_list', to: 'projects#list'
  
  
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
