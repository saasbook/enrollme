Rails.application.routes.draw do

  resources :users do
    collection { post :import }
  end

  get '/without_team', to: 'users#without'
  post '/create_team', to: 'users#start_team'
  post '/join_team', to: 'users#join_team'
  get '/help', to: 'users#user_help'
  
  resources :team

  post 'team/:id/submit', to: 'team#submit', as: "submit_team"
  post 'team/:id/unsubmit', to: 'team#unsubmit', as: "unsubmit_team"
  get 'team/:id/mygroup', to: 'team#showgroup', as: "mygroup"

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'
  
  get 'auth/:provider/callback', to: 'session#create'
  get 'auth/failure', to: redirect('/')
  
  resources :admins
  get '/admin/approve_team', to: 'admins#approve'
  get '/admin/disapprove_team', to: 'admins#disapprove'
  get '/admin/undo_approve_team', to: 'admins#undo_approve'
  get '/admin/superadmin', to: 'admins#superadmin', as: "superadmin"
  get '/admin/reset_semester', to: 'admins#reset_semester', as: "reset_semester"
  post '/admin/reset_database', to: 'admins#reset_database', as: "reset_database"
  patch '/admin/transfer', to: 'admins#transfer', as: 'admin_transfer'
  patch '/admin/delete', to: 'admins#delete', as: 'admin_delete'
  get '/admin/tutorial', to: 'admins#admin_tutorial'
  get '/admin/download', to: 'admins#download'

  get '/admin/email', to: 'admins#email', as: 'admins_send_email'
  post '/admin/create_email', to: 'admins#create_email', as: 'create_email'
  get '/admin/email_success', to: 'admins#email_success', as: 'success_email'
  
  post '/admin/email', to: "admins#team_list_email", as: 'admins_email'
  
  get '/download_team_info', to: "file#download_approved_teams"
  
  get '/discussion/edit', to: "discussion#edit_index", as: "edit_discussion_index"
  
  post '/discussion/edit', to: "discussion#edit_index_post"
  
  post '/discussion/edit_index', to:'discussion#edit_disc', as: "edit_discussion_post"
  
  resources :discussion

  resources :submissions
  
  resources :group
  
  get '/admin/select_group', to:'group#select_group'
  
  post '/admin/select_group', to:'group#select_group', as: 'select_group'
  
  post '/admin/merge', to:'group#merge', as: 'merge_group'
  
  post '/admin/unmerge', to:'group#unmerge', as: 'unmerge_group'
  
  post '/admin/random', to:'group#random', as: 'random_group'
  
  get '/admin/im', to: 'admins#show_import', as: 'import_page'
  
  root 'session#new'

  # TODO: something for route not found
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  get "*path", to: redirect("/")


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase


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
