Rails.application.routes.draw do
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # viewparty routes ##############################################
  get '/viewparty', to: 'viewparty/landing#index'
  get '/viewparty/register', to: 'viewparty/viewers#new', as: 'register'
  post '/viewparty/register', to: 'viewparty/viewers#create'

  get 'viewparty/login', to: 'viewparty/sessions#new'
  post 'viewparty/login', to: 'viewparty/sessions#create'
  delete 'viewparty/logout', to: 'viewparty/sessions#destroy'

  namespace :viewparty do
    resources :viewers, only: [:index, :create, :new, :show] do
      resources :viewer_parties, only: :index, path: 'discover', as: 'discover'
      resources :dashboard, only: :show, path: 'dashboard', as: 'dashboard'
      
      resources :movies, only: :index, as: 'results'
      resources :movies, only: :show do
        resources :viewer_parties, only: [:new, :create], path: 'viewing_party', as: 'viewing_party'
      end
    end
  end


  # all adopt routes ##############################################
  namespace :adopt do
    resources :applications, except: :destroy
    resources :shelters
    resources :pets, except: :new
    resources :veterinarians, except: :new
    resources :veterinary_offices

    namespace :admin do
      resources :applications
      resources :shelters
    end
  end

  get "/adopt/shelters/:shelter_id/pets", to: "adopt/shelters#pets"
  get "/adopt/shelters/:shelter_id/pets/new", to: "adopt/pets#new"
  post "/adopt/shelters/:shelter_id/pets", to: "adopt/pets#create"

  get "/adopt/veterinary_offices/:veterinary_office_id/veterinarians", to: "adopt/veterinary_offices#veterinarians"
  get "/adopt/veterinary_offices/:veterinary_office_id/veterinarians/new", to: "adopt/veterinarians#new"
  post "/adopt/veterinary_offices/:veterinary_office_id/veterinarians", to: "adopt/veterinarians#create"
  get "/adopt/admin/applications/:application_id", to: "adopt/admin/applications#show"
  get "/adopt/admin/shelters", to: "adopt/admin/shelters#index"
  patch "/adopt/application_pets/:pet_id", to: "adopt/application_pets#update"
  get "/adopt/admin/shelters/:id", to: "adopt/admin/shelters#show"


  # main pages ####################################################
  get "/education", to: "educations#index"
  get "/experience", to: "experiences#index"
  get "/portfolio", to: "projects#index"
  get "/adopt", to: "projects#adopt"
  # Defines the root path route ("/")
  # root "posts#index"

  # thirdspace FE ####################################################
  get "thirdspace/locations/search", to: "thirdspace/locations#search"
  get "thirdspace/third_spaces/search", to: "thirdspace/third_spaces#search"
  post "thirdspace/third_spaces/favorite", to: "thirdspace/third_spaces#favorite"
  delete "thirdspace/third_spaces/unfavorite", to: "thirdspace/third_spaces#unfavorite"
  get "thirdspace/third_spaces/:id/edit", to: "thirdspace/third_spaces#edit"
  patch "thirdspace/third_spaces/:id", to: "thirdspace/third_spaces#update"
  get "thirdspace/third_spaces/:id/add_review", to: "thirdspace/third_spaces#add_review"
  patch "thirdspace/third_spaces/:id/add_review", to: "thirdspace/third_spaces#save_review", as: "save_review_third_space"
  get "thirdspace/third_spaces/:id/all_reviews", to: "thirdspace/third_spaces#all_reviews"

  get '/thirdspace/locations/search', to: 'locations#search', as: 'location_search'
  
  get "thirdspace/register", to: "thirdspace/users#new"
  post "thirdspace/register", to: "thirdspace/users#create"
  get "thirdspace/users/support", to: "thirdspace/users#support", as: 'support'
  get "thirdspace/users/:id/recommendations/mood", to: "thirdspace/users#mood_recommendations_index", as: "mood_recommendations"
  get "thirdspace/users/:id/recommendations", to: "thirdspace/users#loc_recommendations_index", as: "recommendations"
  get "thirdspace/users/:id/saved_list", to: "thirdspace/users#saved_list", as: "user_saved_list"
  get "thirdspace/users/:user_id", to: "thirdspace/users#show"
  get "thirdspace/dashboard", to: "thirdspace/users#dashboard"
  get "thirdspace/set_location", to: "thirdspace/users#set_location_form"
  
  get '/thirdspace/contact', to: 'thirdspace/contacts#new', as: :new_contact_form
  post '/thirdspace/contact', to: 'thirdspace/contacts#create'
  get '/thirdspace/privacy', to: 'thirdspace/users#privacy', as: 'thirdspace/privacy'
  
  get "thirdspace/login", to: "thirdspace/users#login_form"
  post "thirdspace/login", to: "thirdspace/users#login"
  
  get "thirdspace/logout", to: "thirdspace/users#logout"
  
  get '/thirdspace/initiate_otp_verification', to: 'thirdspace/users#initiate_verification'
  post '/thirdspace/validate_otp', to: 'thirdspace/users#validate_otp'
  get '/thirdspace/validate_otp', to: 'thirdspace/users#validate_otp_form'

  match '/search_locations/update', to: 'thirdspace/search_locations#update', via: [:get, :patch], as: :update_search_location
  get "thirdspace/search_locations/set_mood", to: "thirdspace/users#set_mood"
  patch '/search_locations/update_loc', to: 'thirdspace/search_locations#update_search_location', as: :update_location_param
      
      
  get '/thirdspace/user/auth/google_oauth2/callback', to: 'thirdspace/sessions#create'
  post '/thirdspace/geolocation_storage/lat_lon_session', to: 'thirdspace/geolocation_storage#lat_lon_session'
  
  get '/thirdspace/password/reset', to: 'thirdspace/password_resets#new'
  post '/thirdspace/password/reset', to: 'thirdspace/password_resets#create'
  get '/thirdspace/password/reset/edit', to: 'thirdspace/password_resets#edit'
  patch '/password/reset/edit', to: 'thirdspace/password_resets#update'
  
  namespace :thirdspace do
    resources :third_spaces do
      get :create_third_space, on: :collection, as: :create_third_space
    end
    resources :saved_locations, only: [:index, :create]
    resources :search_locations, only: [:create] 
    resources :locations, only: [:index, :show, :new, :create]
    resources :users, only: [] do
      resources :third_spaces, only: [:index], controller: 'thirdspace/users/third_spaces'
    end

    namespace :admin do
      get "thirdspace/dashboard", to: "thirdspace/dashboard#index"
    end
  end
  match "thirdspace/error", to: "thirdspace/errors#show", via: :all
end
        